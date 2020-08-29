<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ProductView.aspx.cs" Inherits="ProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="padding-top: 30px">
        <div class="col-md-5">
            <div style="max-width: 480px" class="thumbnail">
                <img src="Images/ProductImages/6/Hanorac Nike Sportswear pe negru03.jpg" alt="img1" />
            </div>
        </div>
        <div class="col-md-7">
            <div class="divDet1">
                <h1 class="proNameView">Hanorac Nike Sportswear pe negru</h1>
                <span class="proOgPriceView">Rs. 1899</span><span class="proPriceDiscountView"> 210 OFF</span>
                <p class="proPriceView">Rs. 1324252523 nice</p>
            </div>
            <div>
                <h5 class="h5Size">Size</h5>
                <div>
                    <asp:RadioButtonList ID="rblSize" RepeatDirection="Horizontal" CssClass="spaced" RepeatLayout="Flow" runat="server">
                        <asp:ListItem Value="M" Text="M"></asp:ListItem>
                        <asp:ListItem Value="L" Text="L"></asp:ListItem>
                        <asp:ListItem Value="XS" Text="XS"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="divDet1">
                <asp:Button ID="btnAddToCart" runat="server" CssClass="mainButton" Text="ADD TO CART" />
            </div>
            <div class="divDet1">
                <h5 class="h5Size">Description</h5>
                <p>Comandă Blana-Hanorace online pe ABOUT YOU. Gamă variată de produse & 0 Lei transport! Livrare rapidă. Livrare gratuită. Numai produse originale. Retur gratuit. Plata ramburs. 100 zile drept de retur. Peste 500 de mărci. Nou venite. Stiluri: casual, urban, sport.</p>
                
                <h5 class="h5Size">Product details</h5>
                <p>Blue printed casual shirt, has a spread collar, button placket, long sleeves, curved hem.</p>
            
                <h5 class="h5Size">Material and Care</h5>
                <p>100% cotton Machine-Wash</p>
            
            </div>
            <div>
                <p>Free Delivery</p>
                <p>30 Days Returns</p>
                <p>Cash on Delivery</p>
            </div>
        </div>
    </div>
    
</asp:Content>

