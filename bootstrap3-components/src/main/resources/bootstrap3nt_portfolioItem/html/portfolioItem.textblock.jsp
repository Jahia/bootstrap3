<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="css" resources="pages/portfolio-v2.css"/>
<template:addResources>
    <!-- CSS Global Compulsory-->
    <link rel="stylesheet" href="${url.currentModule}/assets/css/pages/portfolio-v2.css">
    </template:addResources>

<jcr:nodeProperty node="${currentNode}" name="picture" var="portfolioImage"/>
<c:url value="${url.files}${portfolioImage.node.path}" var="portfolioImageUrl"/>

<li class="col-md-3 col-sm-6 col-xs-12" style=" display: inline-block; opacity: 1;">
  <a href="#">
    <img class="img-responsive" alt="" src="${portfolioImageUrl}">
    <span class="sorting-cover">
      <span>${currentNode.properties['jcr:title'].string}</span>
      <p>${currentNode.properties.description.string}</p>
    </span>
  </a>
</li>