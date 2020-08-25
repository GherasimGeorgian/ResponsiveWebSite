<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddSize.aspx.cs" Inherits="AddSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="form-horizontal">
            <h2>Add Size</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="Size Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtSizeName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" ErrorMessage="This field is Required!" ControlToValidate="txtSizeName" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Brand"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlBrand" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="This field is Required!" ControlToValidate="ddlBrand" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Category"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required!" ControlToValidate="ddlCategory" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Sub Category"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlSubCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="This field is Required!" ControlToValidate="ddlSubCategory" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Gender"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlGender" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="This field is Required!" ControlToValidate="ddlGender" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>


            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-default" OnClick="btnAdd_Click" />

                </div>
            </div>
        </div>
        <h1>Size</h1>
        <hr/>
        <div class="panel panel-default">
            <div class="panel-heading">All sizes</div>

            <asp:Repeater ID="rptrSize" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Brand</th>
                                <th>Category</th>
                                <th>SubCategory</th>
                                <th>Gender</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th><%# Eval("SizeID") %></th>
                        <td><%# Eval("SizeName") %></td>
                        <td><%# Eval("Name") %></td>
                        <td><%# Eval("CatName") %></td>
                        <td><%# Eval("SubCatName") %></td>
                        <td><%# Eval("GenderName") %></td>
                        <td>Edit</td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>
                </FooterTemplate>
            </asp:Repeater>

        </div>
    </div>
</asp:Content>

