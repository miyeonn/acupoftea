<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/palette.js"></script>
</head>
<body>
<p>여기 뜨는거 맞나</p>

<style>
* {
  margin: 0;
  padding: 0;
}

#palette-app {
  .wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    padding: 16px;
  }

  .palette {
    width: 100%;
    max-width: 980px;
    padding: 16px;
    display: grid;
    grid-template-columns: repeat(auto-fill, 40px);
    grid-gap: 8px;
  }

  .btn {
    text-decoration: none;
    cursor: pointer;
    outline: 0;

    border: none;
    border-radius: 2px;
    display: inline-block;
    height: 36px;
    line-height: 36px;
    padding: 0 16px;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14),
      0 3px 1px -2px rgba(0, 0, 0, 0.12), 0 1px 5px 0 rgba(0, 0, 0, 0.2);
    &:hover {
      box-shadow: 0 3px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 7px 0 rgba(0, 0, 0, 0.12),
        0 3px 1px -1px rgba(0, 0, 0, 0.2);
    }
  }
}

</style>
<div id="palette-app"></div>
</body>
</html>