<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Item All</h1>
    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
        For more information about DataTables, please visit the <a target="_blank"
                                                                   href="https://datatables.net">official DataTables documentation</a>.</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Item All</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <form id="search_form" class="form-inline well" action="/item/search" method="get">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name">Name:</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control" id="name" placeholder="Enter title"
                                   value="${ms.name}"
                            >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="price">Price:</label>
                        <div class="col-sm-10">
                            <input type="number" name="price" class="form-control" id="price" placeholder="Enter title"
                                   value="${ms.price}"
                            >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="startdate">Start Date:</label>
                        <div class="col-sm-10">
                            <input type="date" name="startdate" class="form-control" id="startdate" placeholder="Enter title"
                                   value="${ms.startdate}"
                            >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="enddate">End Date:</label>
                        <div class="col-sm-10">
                            <input type="date" name="enddate" class="form-control" id="enddate" placeholder="Enter title"
                                   value="${ms.enddate}"
                            >
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-2">
                            <button id="search_btn" type="submit" class="btn btn-info">Search</button>
                        </div>
                    </div>
                </form>
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>PRICE</th>
                        <th>IMAGE</th>
                        <th>RDATE</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>IMAGE</th>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>PRICE</th>
                        <th>RDATE</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="obj" items="${ilist}">
                        <tr>
                            <td href="#" data-toggle="modal" data-target="#my${obj.id}">
                                <img id="item_img" src="/uimg/${obj.imgname}" style="width: 50px; height: 50px;" />
                            </td>
                            <td>
                                <a href="/item/detail?id=${obj.id}">${obj.id}</a>
                            </td>
                            <td>${obj.name}</td>
                            <td><fmt:formatNumber value="${obj.price}" pattern="#,###,###원"></fmt:formatNumber> </td>
                            <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
                        </tr>
                        <div id="my${obj.id}" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Detail Image</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>${obj.name}</p>
                                        <img src="/uimg/${obj.imgname}"/>


                                    </div>
                                    <div class="modal-footer">
                                        <a href="/item/detail?id=${obj.id}" class="btn btn-info" role="button">Detail</a>
                                        <a href="#" data-dismiss="modal" class="btn btn-info" role="button">Close</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    </tbody>

                </table>
            </div>
        </div>
    </div>
</div>

