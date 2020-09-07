<%@ Page Title="Cart" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="padding-top: 50px;">
        <div class="col-md-8">
            <h5 class="proNameViewCart" runat="server" id="h5NoItems"></h5>
            <asp:Repeater ID="rptrCartProducts" runat="server">
                <ItemTemplate>

                
            <div class="media" style="border: 1px solid #eaeaec;">
                <div class="media-left">
                    <a href="ProductView.aspx?PID=<%#Eval("PID") %>" target="_blank">
                        <img class="media-object" width="100px;" src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("Name") %><%#Eval("Extension") %>" alt="<%#Eval("Name") %>"  onerror="this.src='Images/noimage.jpg';this.onerror='';">
                    </a>
                   </div>
                        <div class="media-body">
                            <h5 class="media-heading proNameViewCart"><%#Eval("Name") %>
                            </h5>
                            <p class="proPriceDiscountView">Size : <%#Eval("SizeNamee") %></p>
                            <span class="proPriceView"><%#Eval("PSelPrice","{0:c}") %></span>
                            <span class="proOgPriceView"><%#Eval("PPrice","{0:0,00}") %></span>
                            <p>
                                 <asp:Button CommandArgument='<%#Eval("PID") + "-" + Eval("SizeIDD")%>' ID="btnRemoveItem" runat="server" CssClass="removeButton" OnClick="btnRemoveItem_Click" Text="Remove" />
                            </p>
                        </div>
                   
                </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        <div class="col-md-4" runat="server" id="divPriceDetails">
            <div style="border-bottom: 1px solid #eaeaec">
                <h5 class="">Price details</h5>
                <div>
                    <label>Cart total</label>
                    <span class="pull-right priceGray" id="spanCartTotal" runat="server"></span>
                </div>
                <div>
                    <label>Cart discount</label>
                    <span class="pull-right priceGreen" id="spanDiscount" runat="server" ></span>
                </div>
            </div>
            <div>
                <div class="proPriceView">
                    <label>Total</label>
                    <span class="pull-right" id="spanTotal" runat="server"></span>
                </div>
                <div>
                     <asp:Button ID="btnBuyNow" runat="server" CssClass="btnBuyNow" OnClick="btnBuyNow_Click" Text="BUY NOW" />
                </div>
            </div>
        </div>
        </div>
       
    
</asp:Content>

