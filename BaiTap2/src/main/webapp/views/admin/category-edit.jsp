<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sửa Danh Mục</title>
</head>
<body>

    <form action="<c:url value='/admin/category/update'/>" method="post" enctype="multipart/form-data">
        
        <!-- Đã sửa name & value thành categoryId -->
        <input type="hidden" name="categoryid" value="${cate.categoryId}">

        <label for="categoryname">Category name:</label><br>
        <input type="text" id="categoryname" name="categoryname" value="${cate.categoryname}" required><br><br>

        <label for="images">Link images:</label><br>
        <input type="text" id="images" name="images" value="${cate.images}"><br><br>

        <!-- Xử lý hiển thị ảnh cũ an toàn -->
        <c:choose>
            <c:when test="${not empty cate.images && fn:startsWith(cate.images, 'https')}">
                <c:url value="${cate.images}" var="imgUrl" />
            </c:when>
            <c:otherwise>
                <c:url value="/image?fname=${cate.images}" var="imgUrl" />
            </c:otherwise>
        </c:choose>
        
        <img height="150" width="200" src="${imgUrl}" alt="Current Image" /><br><br>

        <label for="images1">Upload new image:</label><br>
        <input type="file" id="images1" name="images1"><br><br>

        <label>Status:</label><br>
        <input type="radio" id="ston" name="status" value="1" ${cate.status == 1 ? 'checked' : ''}>
        <label for="ston">Hoạt động</label><br>
        
        <input type="radio" id="stoff" name="status" value="0" ${cate.status != 1 ? 'checked' : ''}>
        <label for="stoff">Khóa</label><br><br>

        <input type="submit" value="Update">
    </form>

</body>
</html>