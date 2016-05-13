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

<c:set var="items" value="${jcr:getChildrenOfType(currentNode, 'bootstrap3nt:carouselItem')}"/>

<div id="carousel_${currentNode.identifier}" class="carousel slide" data-ride="carousel">
    <%-- Indicators --%>
    <c:set var="useIndicators" value="true"/>
    <c:if test="${not empty currentNode.properties.useIndicators}">
        <c:set var="useIndicators" value="${currentNode.properties.useIndicators.boolean}"/>
    </c:if>
    <c:if test="${useIndicators}">
        <ol class="carousel-indicators">
            <c:forEach items="${items}" var="item" varStatus="status">
                <li data-target="#carousel_${currentNode.identifier}" data-slide-to="${status.index}" <c:if test='${status.index == 0}'>class="active"</c:if>></li>
            </c:forEach>
        </ol>
    </c:if>

    <%-- Wrapper for slides --%>
    <div class="carousel-inner" role="listbox"  <c:if test="${not empty currentNode.properties.height and not empty currentNode.properties.height.long}"> style="height: ${currentNode.properties.height.long}px"</c:if> >
        <c:forEach items="${items}" var="item" varStatus="status">
            <div class="item <c:if test='${status.first}'>active</c:if>">
                <template:module node="${item}" nodeTypes="bootstrap3nt:carouselItem">
                    <template:param name="maxHeight" value="${(not empty currentNode.properties.height and not empty currentNode.properties.height.long)?currentNode.properties.height.long:''}"/>
                </template:module>
            </div>
        </c:forEach>
    </div>

    <%-- Controls --%>
    <c:set var="useLeftAndRightControls" value="true"/>
    <c:if test="${not empty currentNode.properties.useLeftAndRightControls}">
        <c:set var="useLeftAndRightControls" value="${currentNode.properties.useLeftAndRightControls.boolean}"/>
    </c:if>
    <c:if test="${useLeftAndRightControls}">
        <a class="left carousel-control" href="#carousel_${currentNode.identifier}" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only"><fmt:message key="bootstrap3nt_carousel.label.previous"/></span>
        </a>
        <a class="right carousel-control" href="#carousel_${currentNode.identifier}" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only"><fmt:message key="bootstrap3nt_carousel.label.next"/></span>
        </a>
    </c:if>
</div>

<c:if test="${renderContext.editMode}">
    <template:module path="*" nodeTypes="bootstrap3nt:carouselItem"/>
</c:if>
