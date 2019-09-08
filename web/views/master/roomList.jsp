<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/master/commonNav.jsp"%>

<%@ page import="java.util.List, com.jb.pension.model.vo.Room, com.jb.pension.model.vo.Pension" %>

<%
	Pension p = (Pension)request.getAttribute("pInfo");
	List<Room> rooms = (List)request.getAttribute("rooms");
	int cPage = (int)request.getAttribute("cPage");
%>

     <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    
    <div class="col-md-10 album py-5 bg-light">
    	<div class="row">
    		<h1 style="text-align:center"><%=p.getpName() %></h1>
    		<div>펜션정보<br>
    			p_code : <%=p.getpCode() %><br>
    			p_addr : <%=p.getpName() %><br>
    			p_tel : <%=p.getpTel() %><br>
    			o_id : <%=p.getoId() %>
    		</div>
    	</div>
    	
    	<br><br>
    	
    	<div class="row">
	    	<% if(rooms!=null && !rooms.isEmpty()) {
				for(Room r : rooms) { %>
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%"
								height="225" xmlns="http://www.w3.org/2000/svg"
								preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
								aria-label="Placeholder: Thumbnail">
				            	<title>Placeholder</title>
				            	<rect width="100%" height="100%" fill="#55595c"></rect>
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">이미지 준비중</text>
				            </svg>
							<div class="card-body">
								<p class="card-text">
									ROOM INFO <br>
									R_NO : <%=r.getrNo() %> <br>
									R_NAME : <%=r.getrName() %> <br>
									R_PRICE : <%=r.getrPrice() %> <br>
									R_NOP : <%=r.getrNop() %> <br>
								</p>
								<div class="btn-group">
									<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
									<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
								</div>
							</div>
						</div>
					</div>
			<%
				}
			}
			%>
			
			<br><br>
      </div>

	<div class="text-center">
		<ul class="pagination">
			<li><%=request.getAttribute("pageBar") %></li>
		</ul>
	</div>

</div>
  

<%@ include file="/views/common/footer.jsp"%>