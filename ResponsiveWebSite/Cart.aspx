<%@ Page Title="Cart" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="padding-top: 50px;">
        <div class="col-md-8">
            <h5 class="proNameViewCart">My Cart (2 Items)</h5>
            <div class="media" style="border: 1px solid #eaeaec;">
                <div class="media-left">
                    <a>
                        <img class="media-object" width="100px;" src="Images/ProductImages/5/Pantofi adidas03.jpg" alt="img">
                    </a>
                   </div>
                        <div class="media-body">
                            <h5 class="media-heading proNameViewCart">Media heading
                            </h5>
                            <p class="proPriceDiscountView">Size : 34</p>
                            <span class="proPriceView">Rs: 1234</span>
                            <span class="proOgPriceView">3434</span>
                            <p>
                                 <asp:Button ID="btnRemoveItem" runat="server" CssClass="removeButton" OnClick="btnRemoveItem_Click" Text="Remove" />
                            </p>
                        </div>
                   
                </div>

            </div>
        <div class="col-md-4">
            <div style="border-bottom: 1px solid #eaeaec">
                <h5 class="">Price details</h5>
                <div>
                    <label>Cart total</label>
                    <span class="pull-right priceGray">1898</span>
                </div>
                <div>
                    <label>Cart discount</label>
                    <span class="pull-right priceGreen">-232</span>
                </div>
            </div>
            <div>
                <div class="proPriceView">
                    <label>Total</label>
                    <span class="pull-right"> rs:1400</span>
                </div>
                <div>
                     <asp:Button ID="btnBuyNow" runat="server" CssClass="btnBuyNow" OnClick="btnBuyNow_Click" Text="BUY NOW" />
                </div>
            </div>
        </div>
        </div>
       
    
</asp:Content>

