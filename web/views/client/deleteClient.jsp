<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ include file="/views/common/header.jsp"%>

 <section>

        <div class="container-fluid">
            <div class="row content">
                <div class="col-sm-3 sidenav">
                    <br>
                    <br>
                    <h4 id="mypagetitle"><a href="mypage.html">&nbsp;&nbsp;마이페이지</a></h4>
                    

                    <div id="mypageList">

                    <ul class="nav nav-pills nav-stacked">
                        <br>
                        <!-- <li class="active"><a href="#reservation">예약확인/취소</a></li> -->
                        <li><a href="mypage.html">&nbsp;&nbsp;예약확인/취소</a></li>
                        
                        <li><a href="jjim.html">&nbsp;&nbsp;내가찜한객실</a></li>
                        <li><a href="updateUserInfo.html">&nbsp;&nbsp;회원정보수정</a></li>
                        <li class="active"><a href="DeleteUserInfo.html">회원탈퇴</a></li>
                    </ul><br>
                </div>

                </div>
                <section id="container">
                    <br><br><br><br><br>
                    <div class="tit_contents">회원탈퇴</div>
                    <br>
                    <hr><br>

                    <form name="form1" method="post">
                        <table class="updateTable">
                            <colgroup>
                                <col width="160px">
                                <col width="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="point"><strong class="point">*</strong>아이디</th>
                                    <td>javabang</td>
                                </tr>
                                <tr>
                                    <th class="point"><strong class="point">*</strong>비밀번호</th>
                                    <td><input type="password" name="upass" title="비밀번호"></td>
                                </tr>
                                <tr>
                                    <th class="point"><strong class="point">*</strong>탈퇴사유</th>
                                    <td>
                                        <p>
                                            <input type="radio" id="" name="usece" title="탈퇴사유" value="409000001">
                                            <label for="">중개사이트를 이용하지 않아서</label>
                                        </p>
                                        <p>
                                            <input type="radio" id="" name="usece" title="탈퇴사유" value="409000002">
                                            <label for="">이용에 대한 혜택사항이 적어서</label>
                                        </p>
                                        <p>
                                            <input type="radio" id="" name="usece" title="탈퇴사유" value="409000003">
                                            <label for="">사이트 이용방법이 어려워서</label>
                                        </p>
                                        <p>
                                            <input type="radio" id="" name="usece" title="탈퇴사유" value="409000004">
                                            <label for="">고객상담이 불친절해서</label>
                                        </p>
                                        <p>
                                            <input type="radio" id="" name="usece" title="탈퇴사유" value="409000005">
                                            <label for="">기타</label>
                                            <input class="mgl5" type="text" name="nreason" title="기타 탈퇴사유"
                                                style="width:300px;"> </p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <br> <br>

                        <div class="button">

                            <input type="button" onclick="deleteUser();" value="탈퇴">
                            <input type="reset" onclick="location.href='mypage.html' " value="취소">

                        </div>

                        <hr>

            </div>
            
            </form>
            




    </section>

    </section>



<%@ include file="/views/common/footer.jsp"%>