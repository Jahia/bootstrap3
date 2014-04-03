<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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

<div class="thumbnail-style">
  <img class="img-responsive" src="${pictureUrl}" alt="">
  <h3>
  <a>${currentNode.properties['name'].string}</a>
  <small>${currentNode.properties['position'].string}</small>
  </h3>
  <p>${currentNode.properties['description'].string}</p>
  <ul class="list-unstyled list-inline team-socail">
    <c:if test="${not empty currentNode.properties['facebook']}">
      <li>
        <a href="${currentNode.properties['facebook'].string}">
          <i class="icon-facebook"></i>
        </a>
      </li>
	</c:if>  
    <c:if test="${not empty currentNode.properties['twitter']}">
      <li>
      	<a href="${currentNode.properties['twitter'].string}">
      		<i class="icon-twitter"></i>
      	</a>
      </li>
	</c:if>
    <c:if test="${not empty currentNode.properties['google']}">
      <li>
        <a href="${currentNode.properties['google'].string}">
          <i class="icon-google-plus"></i>
        </a>
      </li>
	</c:if>        
  </ul>
</div>