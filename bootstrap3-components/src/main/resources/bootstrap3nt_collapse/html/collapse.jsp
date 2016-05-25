<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="lang" uri="http://jahia.com/tags/languageswitcher" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>
<template:addResources type="javascript" resources="jquery.min.js,bootstrap.min.js"/>

<c:if test="${not renderContext.editMode}">
    <c:set var="cookieName" value="accordion-activatedCollapse_${currentNode.identifier}"/>
    <template:addResources type="inlinejavascript">
        <script type="text/javascript">
            $(document).ready(function () {
                $('#accordion_${currentNode.identifier} a[data-toggle="collapse"]').click(function() {
                    document.cookie = "accordion-activatedCollapse_${currentNode.identifier}=" + this.attributes['href'].value;
                });
                var c = document.cookie;
                var pos = c.indexOf("${cookieName}=");
                if (pos > -1) {
                    var id = c.substr(pos);
                    id = id.substr(id.indexOf('=')+1);
                    if (id.indexOf(';') > -1) {
                        id = id.substr(0,id.indexOf(';'));
                    }
                    $("#accordion_${currentNode.identifier} .collapse").removeClass('in');
                    $(id).addClass("in");
                }
            });
        </script>
    </template:addResources>
</c:if>

<div id="accordion_${currentNode.identifier}" class="panel-group" role="tablist" aria-multiselectable="true">
    <c:set var="items" value="${jcr:getChildrenOfType(currentNode, 'bootstrap3nt:panel')}"/>
    <c:forEach items="${items}" var="item" varStatus="status">
        <template:module node="${item}" nodeTypes="bootstrap3nt:panel" editable="true" view="hidden.collapse">
            <template:param name="index" value="${status.index}"/>
        </template:module>
    </c:forEach>

    <c:if test="${renderContext.editMode}">
        <template:module path="*" nodeTypes="bootstrap3nt:panel"/>
    </c:if>
</div>
