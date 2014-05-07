<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
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
<template:addResources type="javascript" resources="bootstrap.min.js"/>

<c:set var="navigation" value="${currentNode.properties['navigation'].string}"/>
<c:set var="fadeEffect" value="${currentNode.properties['fadeEffect'].boolean}"/>


<%-- Nav tabs --%>
<ul class="nav nav-tabs">
    <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jnt:contentList')}" var="contentList" varStatus="status">
        <li <c:if test="${status.first}"> class="active"</c:if>> <a
                href="#${contentList.name}" data-toggle="${navigation}">${contentList.displayableName}</a></li>
    </c:forEach>
</ul>

<%-- Tab panes --%>
<div class="tab-content">
<c:forEach items="${jcr:getChildrenOfType(currentNode, 'jnt:contentList')}" var="contentList" varStatus="status">
    <c:set var="active" value="${status.first ? ' active in' : ''}"/>
    <c:set var="fade" value="${fadeEffect ? ' fade' : ''}"/>
    <div class="tab-pane ${active} ${fade}" id="${contentList.name}">
    <template:module node="${contentList}"/>
    </div>
</c:forEach>
</div>

<c:if test="${renderContext.editMode}">
    <template:module path="*" nodeTypes="jnt:contentList"/>
</c:if>
<template:addResources type="inline">
    <script>
        $(document).ready(function () {
            if (location.hash !== '') $('a[href="' + location.hash + '"]').tab('show');
            return $('a[data-toggle="tab"],a[data-toggle="pill"]').on('shown', function (e) {
                return location.hash = $(e.target).attr('href').substr(1);
            });
        });
    </script>
</template:addResources>