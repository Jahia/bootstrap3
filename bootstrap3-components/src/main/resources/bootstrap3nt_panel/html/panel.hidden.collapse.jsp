<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="lang" uri="http://jahia.com/tags/languageswitcher" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>

<c:set var="state" value="${currentNode.properties['state'].string}"/>
<c:set var="footer" value="${currentNode.properties['footer'].string}"/>

<c:set var="index" value="${currentResource.moduleParams.index}"/>
<c:set var="visible" value="${index == 0}"/>

<div class="panel panel-${state}">
    <div class="panel-heading" role="tab" id="heading_${currentNode.identifier}">
        <h4 class="panel-title">
            <a role="button" data-toggle="collapse" href="#collapse_${currentNode.identifier}"
               aria-expanded="${visible ? 'true' : 'false'}" aria-controls="collapse_${currentNode.identifier}"
               data-parent="#accordion_${currentNode.parent.identifier}">
                ${fn:escapeXml(currentNode.displayableName)}
            </a>
        </h4>
    </div>
    <div id="collapse_${currentNode.identifier}"
         class="panel-collapse collapse <c:if test='${visible}'>in</c:if>" role="tabpanel"
         aria-labelledby="heading_${currentNode.name}">
        <div class="panel-body">
            <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jmix:droppableContent')}" var="droppableContent">
                <template:module path="${droppableContent.path}"/>
            </c:forEach>
            <c:if test="${renderContext.editMode}">
                <template:module path="*" nodeTypes="jmix:droppableContent"/>
            </c:if>
        </div>
        <c:if test="${not empty footer}">
            <div class="panel-footer">${footer}</div>
        </c:if>
    </div>
</div>
