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
<div class="tab-v1">
  <ul class="nav nav-tabs">
    
  <c:forEach items="${jcr:getChildrenOfType(currentNode, 'bootstrap3nt:tabItem')}" var="tabItem1" varStatus="status">
    <li class="${status.first or renderContext.editMode ? ' active' : ''}">  
      <a href="#${tabItem1.properties['tabname'].string}" data-toggle="tab">${tabItem1.properties['tabname'].string}</a>
    </li>
  </c:forEach>
  </ul> 
  <div class="tab-content">
      <c:forEach items="${jcr:getChildrenOfType(currentNode, 'bootstrap3nt:tabItem')}"  var="tabItem" varStatus="status">
		<template:module node="${tabItem}" view="default">
          <template:param name="first" value="${status.first}"/>  
        </template:module>
  </c:forEach>
</div>                                                                                      
<c:if test="${renderContext.editMode}">
    <template:module path="*"/>
</c:if>