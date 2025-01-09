<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StorePage.aspx.cs" Inherits="Soil.StorePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Store Page</title>
    <style>
        .category-section {
            margin-bottom: 20px;
        }
        .category-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .product {
            display: inline-block;
            width: 150px;
            text-align: center;
            margin: 10px;
        }
        .product img {
            width: 100px;
            height: 100px;
        }
        .discount {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater ID="RepeaterCategories" runat="server">
                <ItemTemplate>
                    <div class="category-section">
                        <div class="category-title"><%# Eval("CategoryName") %></div>
                        <asp:Repeater ID="RepeaterProducts" runat="server" DataSource='<%# Eval("Products") %>'>
                            <ItemTemplate>
                                <div class="product">
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("ProductName") %>' />
                                    <div><%# Eval("ProductName") %></div>
                                    <div class="discount">Upto <%# Eval("DiscountPercentage") %> OFF</div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>

