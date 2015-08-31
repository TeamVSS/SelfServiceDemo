<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeBehind="BillView.aspx.cs" Inherits="SelfServiceDemo.BillView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
       
    <table class="style1" style="width: 100%; font-family: 'Times New Roman';" left="300px" top="760px" height="468px" align="center">
    <tr>
        <td colspan="3" align="center" bgcolor="White" style="height: 20px">
            Masked Customer Name</td>
    </tr>
        <tr>
        <td bgcolor="White" colspan="3" align="center" style="font-size: large; font-weight: bold">
            Primary Number : <asp:Label ID="lblPhone" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td  class="style5" colspan="3" bgcolor="White" style="height: 20px; font-size: large; font-weight: bold;" align="center">
            Account Number : <asp:Label ID="lblAccount" runat="server"></asp:Label></td>
    </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="center" class="style5" colspan="3" bgcolor="White" style="height: 23px; font-size: large; font-weight: bold;">
            Bill Date : <asp:Label ID="lblDate" runat="server"></asp:Label></td>
    </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
      
    <tr>
        <td class="style7" colspan="3" bgcolor="White" style="color: #FFFFFF">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7" colspan="3" bgcolor="Red" style="color: #FFFFFF; font-size: x-large;">
            Services</td>
    </tr>
        <tr>
        <td bgcolor="White" colspan="3">
            Your bundle includes Fios TV Prime HD which includes $12.99 for basic services , Fios internet 50/50 and Twenty Fifteen Freedom Essentials</td>
    </tr>
    <tr>
        <td bgcolor="White" colspan="3">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="modal-sm" bgcolor="White" style="border-color: #FFFFFF; border-bottom-style: outset;">
            
         
            <asp:GridView ID="GridViewService" runat="server" BackColor="White" BorderColor="White" GridLines="None" ShowHeader="False">
                <HeaderStyle BackColor="White" />
            </asp:GridView>
                    
         
        <td align="right" bgcolor="White" style="border-color: #FFFFFF; border-bottom-style: outset;">
            <asp:GridView ID="GridViewServiceAmount" runat="server" BorderColor="White" GridLines="None" ShowHeader="False">
            </asp:GridView>
        </td>
        <td class="style10" style="border-color: #FFFFFF; border-bottom-style: outset;" bgcolor="White" align="center">
            <asp:Label ID="lblBundleDate" runat="server"></asp:Label></td>
    </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; font-size: large; font-weight: bold;">
            <br />
            SubTotal</td>
        <td align="right" bgcolor="White" style="width: 245px"><hr />
            $<asp:Label ID="lblSubTotal1" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></td>
        <td class="style10" style="width: 245px" bgcolor="White"><br />
            &nbsp;</td>
        </tr>
    <tr>
        <td bgcolor="White" colspan="3">
            <br />
        </td>
    </tr>
    <tr>
        <td class="style12" colspan="3" bgcolor="Red" style="color: #FFFFFF; font-size: x-large;">
            Additional Services</td>

    </tr>
        <tr>
        <td bgcolor="White" style="font-size: medium; font-style: italic; font-weight: bold; color: #FF0000;" colspan="3">
            </td>
        </tr>
    <tr>
        <td class="modal-sm" bgcolor="White" style="border-bottom-style: outset; border-top-color: #FFFFFF;">
            <asp:GridView ID="GridViewAddService" runat="server" BorderColor="White" GridLines="None" ShowHeader="False">
            </asp:GridView>
        </td>
        <td align="right" bgcolor="White" style="border-bottom-style: outset; border-top-color: #FFFFFF;">
            <asp:GridView ID="GridViewAddServiceAmount" runat="server" BorderColor="White" GridLines="None" ShowHeader="False">
                <EditRowStyle BorderColor="#333333" BorderWidth="60px" />
                <RowStyle BorderColor="White" BorderWidth="2px" />
                <SelectedRowStyle BorderColor="White" BorderWidth="2px" />
            </asp:GridView>
        </td>
        <td class="style10" align="center" style="border-bottom-style: outset; border-top-color: #FFFFFF;" bgcolor="White">
            <asp:Label ID="lblOnlineBackupDate" runat="server"></asp:Label></td>
    </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; font-size: medium; font-style: italic;">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
        </tr>
    <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; font-size: large; font-weight: bold;">
            <br />
            SubTotal</td>
        <td align="right" bgcolor="White" style="width: 245px"><hr />
            $<asp:Label ID="lblSubTotal2" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></td>
        <td class="style10" style="width: 245px" bgcolor="White"><br />
            &nbsp;</td>
    </tr>
    <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
    <tr>
        <td bgcolor="White" colspan="3">
            &nbsp;</td>
    </tr>
         <tr>
        <td class="style12" colspan="3" bgcolor="Red" style="color: #FFFFFF; font-size: x-large; height: 31px;">
            Fees &amp; Other Charges</td>
        </tr>
        <tr>
        <td bgcolor="White" style="font-size: medium; font-style: italic; font-weight: bold; color: #FF0000;" colspan="3">
            </td>
        </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="border-bottom-style: outset; border-top-color: #FFFFFF; font-size: medium;">
            Taxes</td>
        <td align="right" bgcolor="White" style="border-bottom-style: outset; border-top-color: #FFFFFF;">
           <asp:Label ID="lblFederalTax" runat="server"></asp:Label></td>
        <td class="style10" align="center" style="border-bottom-style: outset; border-top-color: #FFFFFF;" bgcolor="White">
            &nbsp;</td>
        </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; font-size: large; font-weight: bold;">
            <br />
            Total Due Amount</td>
        <td align="right" bgcolor="White" style="width: 245px"><hr />
            $<asp:Label ID="lblTotalDue" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></td>
        <td class="style10" style="width: 245px" bgcolor="White"><br />
            &nbsp;</td>
        </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; height: 23px;">
             </td>
        <td bgcolor="White" style="width: 245px; height: 23px;">
             </td>
        <td class="style10" style="width: 245px; height: 23px;" bgcolor="White">
             </td>
    </tr>
         <tr>
        <td bgcolor="White" align="center" colspan="3" style="height: 30px">
            &nbsp;</td> </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>

</table>

        

     
    <table class="style1" style="width: 100%; font-family: 'Times New Roman';" left="300px" top="760px" height="468px" align="left">
    <tr>
        <td align="center" bgcolor="Red" colspan="3" style="height: 23px">
          

            <asp:Label ID="Label1" runat="server" Text="Previous Month Bills" Font-Bold="True" Font-Size="X-Large" ForeColor="White"></asp:Label></td>
    </tr>
        <tr>
        <td colspan="3" align="center" bgcolor="White" style="height: 20px">
            Masked Customer Name</td>
    </tr>
        <tr>
        <td bgcolor="White" colspan="3" align="center" style="font-size: large; font-weight: bold">
            Primary Number : <asp:Label ID="p1lblPhone" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td  class="style5" colspan="3" bgcolor="White" style="height: 20px; font-size: large; font-weight: bold;" align="center">
            Account Number : <asp:Label ID="p1lblAccount" runat="server"></asp:Label></td>
    </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="center" class="style5" colspan="3" bgcolor="White" style="height: 23px; font-size: large; font-weight: bold;">
            Bill Date : <asp:Label ID="p1lblDate" runat="server"></asp:Label></td>
    </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
       
    <tr>
        <td class="style7" colspan="3" bgcolor="White" style="color: #FFFFFF">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7" colspan="3" bgcolor="Red" style="color: #FFFFFF; font-size: x-large;">
            Services</td>
    </tr>
        <tr>
        <td bgcolor="White" colspan="3">
            Your bundle includes Fios TV Prime HD which includes $12.99 for basic services , Fios internet 50/50 and Twenty Fifteen Freedom Essentials</td>
    </tr>
    <tr>
        <td bgcolor="White" colspan="3">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="modal-sm" bgcolor="White" style="border-color: #FFFFFF; border-bottom-style: outset;">
            
         
            <asp:GridView ID="p1GridViewServiceName" runat="server" BackColor="White" BorderColor="White" GridLines="None" ShowHeader="False">
                <HeaderStyle BackColor="White" />
            </asp:GridView>
                    
         
        <td align="right" bgcolor="White" style="border-color: #FFFFFF; border-bottom-style: outset;">
            <asp:GridView ID="p1GridViewServiceAmount" runat="server" BorderColor="White" GridLines="None" ShowHeader="False">
            </asp:GridView>
        </td>
        <td class="style10" style="border-color: #FFFFFF; border-bottom-style: outset;" bgcolor="White" align="center">
            <asp:Label ID="Label6" runat="server"></asp:Label></td>
    </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; font-size: large; font-weight: bold;">
            <br />
            SubTotal</td>
        <td align="right" bgcolor="White" style="width: 245px"><hr />
            $<asp:Label ID="p1lblSubTotal1" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></td>
        <td class="style10" style="width: 245px" bgcolor="White"><br />
            &nbsp;</td>
        </tr>
    <tr>
        <td bgcolor="White" colspan="3">
            <br />
        </td>
    </tr>
    <tr>
        <td class="style12" colspan="3" bgcolor="Red" style="color: #FFFFFF; font-size: x-large;">
            Additional Services</td>

    </tr>
        <tr>
        <td bgcolor="White" style="font-size: medium; font-style: italic; font-weight: bold; color: #FF0000;" colspan="3">
            </td>
        </tr>
    <tr>
        <td class="modal-sm" bgcolor="White" style="border-bottom-style: outset; border-top-color: #FFFFFF;">
            <asp:GridView ID="p1GridViewAddServiceName" runat="server" BorderColor="White" GridLines="None" ShowHeader="False">
            </asp:GridView>
        </td>
        <td align="right" bgcolor="White" style="border-bottom-style: outset; border-top-color: #FFFFFF;">
            <asp:GridView ID="p1GridViewAddServiceAmount" runat="server" BorderColor="White" GridLines="None" ShowHeader="False">
                <EditRowStyle BorderColor="#333333" BorderWidth="60px" />
                <RowStyle BorderColor="White" BorderWidth="2px" />
                <SelectedRowStyle BorderColor="White" BorderWidth="2px" />
            </asp:GridView>
        </td>
        <td class="style10" align="center" style="border-bottom-style: outset; border-top-color: #FFFFFF;" bgcolor="White">
            <asp:Label ID="Label8" runat="server"></asp:Label></td>
    </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; font-size: medium; font-style: italic;">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
        </tr>
    <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; font-size: large; font-weight: bold;">
            <br />
            SubTotal</td>
        <td align="right" bgcolor="White" style="width: 245px"><hr />
            $<asp:Label ID="p1lblSubTotal2" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></td>
        <td class="style10" style="width: 245px" bgcolor="White"><br />
            &nbsp;</td>
    </tr>
    <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
    <tr>
        <td bgcolor="White" colspan="3">
            &nbsp;</td>
    </tr>
         <tr>
        <td class="style12" colspan="3" bgcolor="Red" style="color: #FFFFFF; font-size: x-large; height: 31px;">
            Fees &amp; Other Charges</td>
        </tr>
        <tr>
        <td bgcolor="White" style="font-size: medium; font-style: italic; font-weight: bold; color: #FF0000;" colspan="3">
            </td>
        </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="border-bottom-style: outset; border-top-color: #FFFFFF; font-size: medium;">
            Taxes</td>
        <td align="right" bgcolor="White" style="border-bottom-style: outset; border-top-color: #FFFFFF;">
           <asp:Label ID="p1lblFederalTax" runat="server"></asp:Label></td>
        <td class="style10" align="center" style="border-bottom-style: outset; border-top-color: #FFFFFF;" bgcolor="White">
            &nbsp;</td>
        </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; font-size: large; font-weight: bold;">
            <br />
            Total Due</td>
        <td align="right" bgcolor="White" style="width: 245px"><hr />
            $<asp:Label ID="p1lblTotalDue" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></td>
        <td class="style10" style="width: 245px" bgcolor="White"><br />
            &nbsp;</td>
        </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; height: 23px;">
             </td>
        <td bgcolor="White" style="width: 245px; height: 23px;">
             </td>
        <td class="style10" style="width: 245px; height: 23px;" bgcolor="White">
             </td>
    </tr>
         <tr>
        <td bgcolor="White" align="center" colspan="3" style="height: 30px">
            &nbsp;</td> </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>

</table>

  
    <table class="style1" style="width: 100%; font-family: 'Times New Roman';" left="300px" top="760px" height="468px" align="left">
    <tr>
        <td colspan="3" align="center" bgcolor="White" style="height: 20px">
            Masked Customer Name</td>
    </tr>
        <tr>
        <td bgcolor="White" colspan="3" align="center" style="font-size: large; font-weight: bold">
            Primary Number : <asp:Label ID="p2lblPhone" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td  class="style5" colspan="3" bgcolor="White" style="height: 20px; font-size: large; font-weight: bold;" align="center">
            Account Number : <asp:Label ID="p2lblAccount" runat="server"></asp:Label></td>
    </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="center" class="style5" colspan="3" bgcolor="White" style="height: 23px; font-size: large; font-weight: bold;">
            Bill Date : <asp:Label ID="p2lblDate" runat="server"></asp:Label></td>
    </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
       
    <tr>
        <td class="style7" colspan="3" bgcolor="White" style="color: #FFFFFF">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7" colspan="3" bgcolor="Red" style="color: #FFFFFF; font-size: x-large;">
            Services</td>
    </tr>
        <tr>
        <td bgcolor="White" colspan="3">
            Your bundle includes Fios TV Prime HD which includes $12.99 for basic services , Fios internet 50/50 and Twenty Fifteen Freedom Essentials</td>
    </tr>
    <tr>
        <td bgcolor="White" colspan="3">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="modal-sm" bgcolor="White" style="border-color: #FFFFFF; border-bottom-style: outset;">
            
         
            <asp:GridView ID="p2GridViewServiceName" runat="server" BackColor="White" BorderColor="White" GridLines="None" ShowHeader="False">
                <HeaderStyle BackColor="White" />
            </asp:GridView>
            </td>
                    
         
        <td align="right" bgcolor="White" style="border-color: #FFFFFF; border-bottom-style: outset;">
            <asp:GridView ID="p2GridViewServiceAmount" runat="server" BorderColor="White" GridLines="None" ShowHeader="False">
            </asp:GridView>
        </td>
        <td class="style10" style="border-color: #FFFFFF; border-bottom-style: outset;" bgcolor="White" align="center">
            <asp:Label ID="Label16" runat="server"></asp:Label></td>
    </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; font-size: large; font-weight: bold;">
            <br />
            SubTotal</td>
        <td align="right" bgcolor="White" style="width: 245px"><hr />
            $<asp:Label ID="p2lblSubTotal1" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></td>
        <td class="style10" style="width: 245px" bgcolor="White"><br />
            &nbsp;</td>
        </tr>
    <tr>
        <td bgcolor="White" colspan="3">
            <br />
        </td>
    </tr>
    <tr>
        <td class="style12" colspan="3" bgcolor="Red" style="color: #FFFFFF; font-size: x-large;">
            Additional Services</td>

    </tr>
        <tr>
        <td bgcolor="White" style="font-size: medium; font-style: italic; font-weight: bold; color: #FF0000;" colspan="3">
            </td>
        </tr>
    <tr>
        <td class="modal-sm" bgcolor="White" style="border-bottom-style: outset; border-top-color: #FFFFFF;">
            <asp:GridView ID="p2GridViewAddServiceName" runat="server" BorderColor="White" GridLines="None" ShowHeader="False">
            </asp:GridView>
        </td>
        <td align="right" bgcolor="White" style="border-bottom-style: outset; border-top-color: #FFFFFF;">
            <asp:GridView ID="p2GridViewAddServiceAmount" runat="server" BorderColor="White" GridLines="None" ShowHeader="False">
                <EditRowStyle BorderColor="#333333" BorderWidth="60px" />
                <RowStyle BorderColor="White" BorderWidth="2px" />
                <SelectedRowStyle BorderColor="White" BorderWidth="2px" />
            </asp:GridView>
        </td>
        <td class="style10" align="center" style="border-bottom-style: outset; border-top-color: #FFFFFF;" bgcolor="White">
            <asp:Label ID="Label18" runat="server"></asp:Label></td>
    </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; font-size: medium; font-style: italic;">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
        </tr>
    <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; font-size: large; font-weight: bold;">
            <br />
            SubTotal</td>
        <td align="right" bgcolor="White" style="width: 245px"><hr />
            $<asp:Label ID="p2lblSubTotal2" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></td>
        <td class="style10" style="width: 245px" bgcolor="White"><br />
            &nbsp;</td>
    </tr>
    <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
    <tr>
        <td bgcolor="White" colspan="3">
            &nbsp;</td>
    </tr>
         <tr>
        <td class="style12" colspan="3" bgcolor="Red" style="color: #FFFFFF; font-size: x-large; height: 31px;">
            Fees &amp; Other Charges</td>
        </tr>
        <tr>
        <td bgcolor="White" style="font-size: medium; font-style: italic; font-weight: bold; color: #FF0000;" colspan="3">
            </td>
        </tr>
        <tr>
        <td class="modal-sm" bgcolor="White" style="border-bottom-style: outset; border-top-color: #FFFFFF; font-size: medium;">
            Taxes</td>
        <td align="right" bgcolor="White" style="border-bottom-style: outset; border-top-color: #FFFFFF;">
           <asp:Label ID="p2lblFederalTax" runat="server"></asp:Label></td>
        <td class="style10" align="center" style="border-bottom-style: outset; border-top-color: #FFFFFF;" bgcolor="White">
            &nbsp;</td>
        </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; font-size: large; font-weight: bold;">
            <br />
            Total Due</td>
        <td align="right" bgcolor="White" style="width: 245px"><hr />
            $<asp:Label ID="p2lblTotalDue" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></td>
        <td class="style10" style="width: 245px" bgcolor="White"><br />
            &nbsp;</td>
        </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px; height: 23px;">
             </td>
        <td bgcolor="White" style="width: 245px; height: 23px;">
             </td>
        <td class="style10" style="width: 245px; height: 23px;" bgcolor="White">
             </td>
    </tr>
         <tr>
        <td bgcolor="White" align="center" colspan="3" style="height: 30px">
            &nbsp;</td> </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>
         <tr>
        <td class="modal-sm" bgcolor="White" style="width: 243px">
            &nbsp;</td>
        <td bgcolor="White" style="width: 245px">
            &nbsp;</td>
        <td class="style10" style="width: 245px" bgcolor="White">
            &nbsp;</td>
    </tr>

</table>                   
 
</asp:Content>
