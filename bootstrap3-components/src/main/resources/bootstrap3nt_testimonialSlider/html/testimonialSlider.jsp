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

<div class="carousel slide testimonials testimonials-v1" id="testimonials-${currentNode.properties['jcr:uuid'].string}">
  <div class="carousel-inner">
    <c:forEach items="${currentNode.nodes}" var="testimonialItem" varStatus="status">
      <c:if test="${jcr:isNodeType(testimonialItem,'bootstrap3nt:testimonialItem')}">
        <template:module node="${testimonialItem}" view="default">
          <template:param name="first" value="${status.first}"/>
        </template:module>
      </c:if>
    </c:forEach>                    
  </div>
  
  <div class="carousel-arrow">
    <a data-slide="prev" href="#testimonials-${currentNode.properties['jcr:uuid'].string}" class="left carousel-control">
      <i class="icon-angle-left"></i>
    </a>
    <a data-slide="next" href="#testimonials-${currentNode.properties['jcr:uuid'].string}" class="right carousel-control">
      <i class="icon-angle-right"></i>
    </a>
  </div>
</div>
<c:if test="${renderContext.editMode}">
    <template:module path="*"/>
</c:if>