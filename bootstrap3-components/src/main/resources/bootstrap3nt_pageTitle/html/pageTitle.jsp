<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<template:addResources type="css" resources="bootstrap.min.css"/>
<c:set var="cssClass"/>
<c:set var="hx"/>
<c:if test="${jcr:isNodeType(currentNode,'bootstrap3mix:advancedPageTitle' )}">
    <c:set var="cssClass" value="${currentNode.properties.cssClass.string}"/>
    <c:set var="hx" value="${currentNode.properties['hx'].string}"/>
</c:if>


<c:if test="${empty hx}">
    <c:set var="hx" value="h1"/>
</c:if>

<${hx}<c:if test="${not empty cssClass}"><c:out value=" "/>class="${cssClass}"</c:if>>${renderContext.mainResource.node.displayableName}</${hx}>