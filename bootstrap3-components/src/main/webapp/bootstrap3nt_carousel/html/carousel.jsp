<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
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

<c:set var="items" value="${jcr:getChildrenOfType(currentNode, 'bootstrap3nt:carouselItem')}"/>
<c:choose>
    <c:when test="${renderContext.editMode}">
        <h2><fmt:message key="bootstrap3nt_carousel"/></h2>
        <c:forEach items="${items}" var="item" varStatus="status">
            <template:module node="${item}" nodeTypes="bootstrap3nt:carouselItem" editable="true"/>
        </c:forEach>
        <template:module path="*" nodeTypes="bootstrap3nt:carouselItem"/>
    </c:when>
    <c:otherwise>
        <div id="carousel${currentNode.name}" class="carousel slide" data-ride="carousel">
                <%-- Indicators --%>
            <ol class="carousel-indicators">
                <c:forEach items="${items}" var="item" varStatus="status">
                    <li data-target="#carousel${currentNode.name}" data-slide-to="${status.index}" <c:if test='${status.index == 0}'>class="active"</c:if>></li>
                </c:forEach>
            </ol>

                <%-- Wrapper for slides --%>
            <div class="carousel-inner" role="listbox">
                <c:forEach items="${items}" var="item" varStatus="status">
                    <div class="item <c:if test='${status.index == 0}'>active</c:if>">
                        <template:module node="${item}" nodeTypes="bootstrap3nt:carouselItem"/>
                    </div>
                </c:forEach>
            </div>

                <%-- Controls --%>
            <a class="left carousel-control" href="#carousel${currentNode.name}" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel${currentNode.name}" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

    </c:otherwise>

</c:choose>
