<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ProductView.aspx.cs" Inherits="ProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="padding-top: 30px">
        <div class="col-md-5">
            <div style="max-width: 480px" class="thumbnail">
                <div id="carousel-id" class="carousel slide" data-ride="carousel">
                    
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-id" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-id" data-slide-to="1" class=""></li>
                        <li data-target="#carousel-id" data-slide-to="2" class=""></li>
                        <li data-target="#carousel-id" data-slide-to="3" class=""></li>
                        <li data-target="#carousel-id" data-slide-to="4" class=""></li>
                    </ol>
                     
                    <div class="carousel-inner">
                    <asp:Repeater ID="rptrImages" runat="server">   
                            <ItemTemplate>
                                <div class="item <%# GetActiveClass(Container.ItemIndex) %>">
                                    
                                    <img src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("Name") %><%#Eval("Extension") %>" alt="<%#Eval("Name") %>"  onerror="this.src='Images/noimage.jpg';this.onerror='';">
                                </div>
                               
                            </ItemTemplate>

                 </asp:Repeater>       
                    </div>
                          
                    <a class="left carousel-control" href="#carousel-id" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                    <a class="right carousel-control" href="#carousel-id" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
               
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <asp:Repeater ID="rptrProductDetails" OnItemDataBound="rptrProductDetails_ItemDataBound" runat="server">
                <ItemTemplate>
            <div class="divDet1">
                <h1 class="proNameView"><%#Eval("PName") %></h1>
                <span class="proOgPriceView"><%#Eval("PPrice") %></span><span class="proPriceDiscountView"><%#string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSelPrice"))) %> OFF</span>
                <p class="proPriceView"><%#Eval("PSelPrice") %></p>
            </div>
            <div>
                <h5 class="h5Size">Size</h5>
                <div>
                    <asp:RadioButtonList ID="rblSize" RepeatDirection="Horizontal" CssClass="spaced" RepeatLayout="Flow" runat="server">
                       
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="divDet1">
                <asp:Button ID="btnAddToCart" runat="server" CssClass="mainButton" Text="ADD TO CART" />
            </div>
            <div class="divDet1">
                <h5 class="h5Size">Description</h5>
                <p><%#Eval("PDescription") %></p>
                
                <h5 class="h5Size">Product details</h5>
                <p><%#Eval("PProductDetails") %></p>
            
                <h5 class="h5Size">Material and Care</h5>
                <p><%#Eval("PMaterialCare") %></p>
            
            </div>
            <div>
                <p><%#((int)Eval("FreeDelivery") == 1)?"Free Delivery":"" %></p>
                <p><%#((int)Eval("30DayRet") == 1)?"30 Days Returns":"" %></p>
                <p><%#((int)Eval("COD") == 1)?"Cash on Delivery":"" %></p>
            </div>
                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("PcategoryID") %>' runat="server" />
                    <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />
                    <asp:HiddenField ID="hfGenderID" Value='<%# Eval("PGender") %>' runat="server" />
                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                    </ItemTemplate>
                </asp:Repeater>
        </div>
    </div>
    
</asp:Content>

