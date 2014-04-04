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

<div class="headline"><h2>${currentNode.properties['title'].string}</h2></div>	
<div id="myCarousel" class="carousel slide carousel-v1">
  <div class="carousel-inner">
      <c:forEach items="${currentNode.nodes}" var="photoItem"  varStatus="status">
        <c:if test="${jcr:isNodeType(photoItem,'bootstrap3nt:photoItem')}">
          <div class="item ${status.first or renderContext.editMode ? ' active' : ''}">
            <template:module node="${photoItem}" view="slider"/>     
          </div>
        </c:if>
      </c:forEach>
    </div>
    <div class="carousel-arrow">
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
        <i class="icon-angle-left"></i>
      </a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">
        <i class="icon-angle-right"></i>
      </a>
    </div>
  </div>
</div>  
<c:if test="${renderContext.editMode}">
  <template:module path="*" nodeTypes="bootstrap3nt:photoItem"/>
</c:if>