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
<template:addResources type="javascript" resources="jquery.min.js"/>
<template:addResources type="javascript" resources="bootstrap.min.js"/>

<c:set var="navigation" value="${currentNode.properties['navigation'].string}"/>
<c:set var="fadeEffect" value="${currentNode.properties['fadeEffect'].boolean}"/>
<c:set var="useSystemNameAsAnchor" value="${currentNode.properties['useSystemNameAsAnchor'].boolean}"/>


<c:set var="anchorName" value="${currentNode.properties.useSystemNameAsAnchor.boolean ? currentNode.name : currentNode.identifier}"/>


<c:choose>
    <c:when test="${not empty currentNode.properties['tabsPosition']}">
        <c:set var="tabsPosition" value="${currentNode.properties['tabsPosition'].string}"/>
    </c:when>
    <c:otherwise>
        <c:set var="tabsPosition" value="top"/>
    </c:otherwise>
</c:choose>

<c:set var="subLists" value="${jcr:getChildrenOfType(currentNode, 'jnt:contentList')}"/>

<c:set var="menuTabsCSSClass" value="nav-${navigation}s"/>
<c:if test="${not empty currentNode.properties['navJustified'] and currentNode.properties['navJustified'].boolean}">
    <c:set var="menuTabsCSSClass" value="${menuTabsCSSClass} nav-justified"/>
</c:if>
<c:if test="${not empty currentNode.properties['navStacked'] and currentNode.properties['navStacked'].boolean}">
    <c:set var="menuTabsCSSClass" value="${menuTabsCSSClass} nav-stacked"/>
</c:if>

<c:if test="${not renderContext.editMode}">
    <c:set var="cookieName" value="bootstrapTabularList-activatedTab_${currentNode.identifier}"/>
    <template:addResources type="inlinejavascript">
        <script type="text/javascript">
            $(document).ready(function () {
                $('#bootstrapTabsList_${currentNode.identifier} ul li a').click(function() {
                    document.cookie = "bootstrapTabularList-activatedTab_${currentNode.identifier}=" + this.attributes['href'].value;
                });
                var c = document.cookie;
                var pos = c.indexOf("${cookieName}=");
                if (pos > -1) {
                    var id = c.substr(pos);
                    id = id.substr(id.indexOf('=')+1);
                    if (id.indexOf(';') > -1) {
                        id = id.substr(0,id.indexOf(';'));
                    }
                    $('#bootstrapTabsList_${currentNode.identifier}').find('a[href="'+ id + '"]').tab('show');
                }
            });
        </script>
    </template:addResources>
</c:if>

<div id="bootstrapTabsList_${currentNode.identifier}" role="tabpanel">
    <c:if test="${tabsPosition eq 'top'}">
        <%@include file="navTabsLoop.jspf" %>
    </c:if>

    <div class="tab-content">
        <c:forEach items="${subLists}" var="subList" varStatus="status">


            <template:module node="${subList}" view="bootstrap3TabsList" editable="false">
                <template:param name="first" value="${status.first}"/>
                <template:param name="count" value="${status.count}"/>
                <template:param name="id" value="${currentNode.identifier}"/>
                <template:param name="fade" value="${fadeEffect}"/>
                <template:param name="isTabContent" value="true"/>
                <template:param name="useSystemNameAsAnchor" value="${useSystemNameAsAnchor}"/>
            </template:module>
        </c:forEach>
    </div>

    <c:if test="${tabsPosition eq 'below'}">
        <%@include file="navTabsLoop.jspf" %>
    </c:if>

    <c:if test="${renderContext.editMode}">
        <template:module path="*" nodeTypes="jnt:contentList"/>
    </c:if>
</div>
<template:addResources targetTag="body" type="inline">
    <script>
        var url = window.location.href;
        if (url.indexOf("#") > 0){
            var activeTab = url.substring(url.indexOf("#") + 1);
            $('.nav[role="tablist"] a[href="#'+activeTab+'"]').tab('show');
        }
    </script>
</template:addResources>
