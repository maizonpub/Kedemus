﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookslevels.aspx.cs" Inherits="Web.resources.bookslevels" %>

<link href="css/iCheck/all.css" rel="stylesheet" type="text/css" />
<!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Web Content
                        <small>Books Levels</small>
                    </h1>
                    <%--<ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Tables</a></li>
                        <li class="active">Data tables</li>
                    </ol>--%>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row" >
                        <div class="col-xs-12">
                            <div class="box" style="width:95%;margin-left:auto;margin-right:auto;padding:10px">
                                <div class="box-header">
                                     <%if (Web.Permissions.Check(int.Parse(Request["opId"]), "Books", "add"))
                                       {%>
                                     <h3 class="box-title"><div style="width:100px;float:right;margin-bottom:-25px"><a class="btn btn-block btn-primary" data-toggle="modal" data-target="#compose-modal" style="color:white;"><i class="fa fa-plus" style="color:white;"></i> Add new</a></div><div style="clear:right"></div><br/></h3><%} %>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped" >
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Title</th>
                                                <th>Language</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for(int i=0;i<results.Count;i++){ %>
                                            <tr id="<%=results[i].id %>">
                                                <td><%=results[i].OrderIndex %></td>
                                                <td><a href="#" id="title<%=i %>" data-type="text" data-pk="<%=results[i].id %>" data-url="resources/editRow.ashx?table=Levels" data-title="Title"><%=results[i].title %></a></td>
                                                <td><a href="#" id="lang<%=i %>" data-type="select" data-pk="<%=results[i].id %>" data-url="resources/editRow.ashx?table=Levels" data-title="Language"><%=results[i].lang %></a></td>
                                                <td><% if (Web.Permissions.Check(int.Parse(Request["opId"]), "Books", "delete"))
               {%><a href="#" class="fa fa-times" onclick="DeleteRow(<%=results[i].id %>)"></a><br /><%} %>
                                                    <a onclick="getSubPage('games.aspx','<%=results[i].id %>')" href="#!games.aspx">Games</a>
                                                </td>
                                            </tr>
                                            <%} %>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Title</th>
                                                <th>Language</th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>

                </section><!-- /.content -->
<!-- DATA TABES SCRIPT -->
        

        <script type="text/javascript">
            $(function () {
                $("#example1").dataTable({ bPaginate: false }).rowReordering({ sURL: "resources/UpdateOrder.ashx", sTable: "Levels" });
            });
            </script>
<%--<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- x-editable (bootstrap version) -->
    <link href="css/bootstrap-editable/bootstrap-editable.css" rel="stylesheet"/>
    <script>
        $(document).ready(function () {
            //toggle `popup` / `inline` mode
            if ($.fn != null)
                $.fn.editable.defaults.mode = 'popup';

            //make username editable
            <% if (Web.Permissions.Check(int.Parse(Request["opId"]), "Books", "edit"))
               {%>
            <%for(int i=0;i<results.Count;i++){%>
            $('#entitle<%=i%>').editable();
            $('#lang<%=i%>').editable({
                type: 'select',
                title: 'Language',
                placement: 'right',
                value: '<%=results[i].lang%>',
                source: [
                    { value: 'fr', text: 'Francais' },
                    { value: 'en', text: 'English' }
                ]
            });
            <%} }%>
        });
    </script>

<div class="modal fade" id="compose-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="fa fa-envelope-o"></i> Add new Level</h4>
                    </div>
                    <form action="#" method="post">
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">English Title:</span>
                                    <input name="title" type="text" class="form-control" placeholder="Title">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">Language:</span>
                                    <select name="langselect" id="langselect" class="form-control">
                                        <option value="fr">Francais</option>
                                        <option value="en">English</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer clearfix">

                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>

                            <button type="button" class="btn btn-primary pull-left" data-dismiss="modal" onclick="AddRow()"><i class="fa fa-plus"></i> Save</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>

        <script type="text/javascript">
            $(function () {

                "use strict";

                //iCheck for checkbox and radio inputs
                $('input[type="checkbox"]').iCheck({
                    checkboxClass: 'icheckbox_minimal-blue',
                    radioClass: 'iradio_minimal-blue'
                });

                //When unchecking the checkbox
                $("#check-all").on('ifUnchecked', function (event) {
                    //Uncheck all checkboxes
                    $("input[type='checkbox']", ".table-mailbox").iCheck("uncheck");
                });
                //When checking the checkbox
                $("#check-all").on('ifChecked', function (event) {
                    //Check all checkboxes
                    $("input[type='checkbox']", ".table-mailbox").iCheck("check");
                });
                //Handle starring for glyphicon and font awesome
                $(".fa-star, .fa-star-o, .glyphicon-star, .glyphicon-star-empty").click(function (e) {
                    e.preventDefault();
                    //detect type
                    var glyph = $(this).hasClass("glyphicon");
                    var fa = $(this).hasClass("fa");

                    //Switch states
                    if (glyph) {
                        $(this).toggleClass("glyphicon-star");
                        $(this).toggleClass("glyphicon-star-empty");
                    }

                    if (fa) {
                        $(this).toggleClass("fa-star");
                        $(this).toggleClass("fa-star-o");
                    }
                });

                //Initialize WYSIHTML5 - text editor
                //$("#email_message").wysihtml5();
            });
            function AddRow() {
                $.post("resources/AddRow.ashx", { table: "Levels", Rows: $("input[name='title']").val() + "|" + $("select[name='langselect']").val() },
                    function (data) {
                        getContent("bookslevels.aspx");
                        $(".modal-backdrop").hide();
                    });
            }
            function DeleteRow(id) {
                $.post("resources/DeleteRow.ashx", { table: "Levels", tableId: id },
                    function (data) {
                        getContent("bookslevels.aspx");
                        $(".modal-backdrop").hide();
                    });
            }
        </script>

