<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ include file="/views/common/header.jsp"%>

	<section>
		<div class="container">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
            	<tr>
            		<td></td>
            		<td></td>
            		<td></td>
            		<td></td>
            		<td></td>
            	</tr>
            	
                <tr>
                    <td>001</td>
                    <td><a href="">오우 쒯</a></td>
                    <td>오건철</td>
                    <td>2019.08.20</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>002</td>
                    <td><a href="">배도부른데 졸리기까지하네</a></td>
                    <td>망했죠?</td>
                    <td>2019.08.20</td>
                    <td>count</td>
                </tr>
                <tr>
                    <td>003</td>
                    <td><a href="">언제끝나요?</a></td>
                    <td>최고관리자</td>
                    <td>2019.08.20</td>
                    <td>1</td>
                </tr>
            </tbody>
        </table>
        <hr/>

        <!-- 글쓰기 버튼 좌우 정렬 pull-right / pull-left -->
        <a class="btn btn-default pull-right">글쓰기</a>
        <a class="btn btn-default pull-right">검색</a>

        <div class="text-center">
            <ul class="pagination">
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
            </ul>
        </div>
    </div>
		
	</section>
    



<%@ include file="/views/common/footer.jsp"%>