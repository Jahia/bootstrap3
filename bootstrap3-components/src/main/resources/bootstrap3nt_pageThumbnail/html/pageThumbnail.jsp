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

<jcr:nodeProperty node="${currentNode}" name="picture" var="picture"/>
<c:url value="${url.files}${picture.node.path}" var="pictureUrl"/>
<c:url value="${currentNode.properties['page'].node.url}" var="pageUrl"/>

<div class="thumbnails thumbnail-style thumbnail-kenburn">
  <div class="thumbnail-img">
    <div class="overflow-hidden">
      <img class="img-responsive" alt="" src="${pictureUrl}">
    </div>
    <a class="btn-more hover-effect" href="${pageUrl}"><fmt:message key="bootstrap3nt_pageThumbnail.readMore"/></a>
  </div>
  <div class="caption">
    <h3>
      <a class="hover-effect" href="${pageUrl}.html">${currentNode.properties['jcr:title'].string}</a>
    </h3>
    <p>${currentNode.properties['description'].string}</p>
  </div>
</div>