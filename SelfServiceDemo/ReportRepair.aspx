<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeBehind="ReportRepair.aspx.cs" Inherits="SelfServiceDemo.ReportRepair" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
        <asp:ScriptManager runat="server" ID="scriptManager1"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="updatePanel1">
        <ContentTemplate>
<br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div style="height: 476px; width: 187px; position: relative; background-color: #D3D3D3; left: -3px; top: 5px;">
                <br />
                <asp:Label ID="Label22" runat="server" BackColor="Red" Font-Italic="True" Font-Names="Helvetica" Font-Size="X-Large" ForeColor="White" Text="Pending Issues"></asp:Label>
                <br />
                <asp:GridView ID="GridView1" runat="server" Font-Names="helvetica" Font-Size="Medium" ForeColor="Black" BackColor="#D3D3D3" ShowHeader="False" ></asp:GridView>
                <br />
                <asp:Label ID="Label25" runat="server" BackColor="Red" Font-Italic="True" Font-Names="Helvetica" Font-Size="X-Large" ForeColor="White" Text="Escalated Issues"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridView2" runat="server" BackColor="#D3D3D3" Font-Names="helvetica" Font-Size="Medium" ForeColor="Black" ShowHeader="False" style="position: relative; left: 3px; top: -23px; width: 76px; height: 72px">
                </asp:GridView>
            </div>
        </ContentTemplate>
        </asp:UpdatePanel>



   <ContentTemplate>
    <div style="height: 471px; margin-left: 40px; width: 348px; background-color: #D3D3D3; position: relative; left: 158px; top: -470px;">
    
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    
        <asp:Label ID="Label9" runat="server" Text="Report a new Issue" ForeColor="White" BackColor="Red" Font-Italic="True" Font-Names="Helvetica" Font-Size="X-Large"></asp:Label>
        <br />
        <br />
    
        <asp:Label ID="Label1" runat="server" Text="Frequently reported issues :" ForeColor="Black" Font-Bold="False" Font-Italic="False" Font-Names="Helvetica" Font-Size="Medium" style="position: relative"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" Font-Names="Helvetica" Font-Size="Medium" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" style="left: 18px; top: 16px">
            <asp:ListItem>Choose an issue</asp:ListItem>
            <asp:ListItem>Resume Connectivity</asp:ListItem>
            <asp:ListItem>Change service address</asp:ListItem>
            <asp:ListItem>Others</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="Did not find it yet?" Font-Bold="True" Font-Italic="True" Font-Names="Helvetica" Font-Size="Medium"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" 
            Text="You can create your own one now. Address it below." ForeColor="Black" Font-Bold="False" Font-Names="Helvetica" Font-Size="Medium"></asp:Label>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table cellspacing="10px" style="width: 63%; height: 19px; background-color: #D3D3D3; position: relative; left: 43px; top: 0px;" cellpadding="10px">
            <tr>
                <td style="height: 26px; width: 74px">
        <asp:Label ID="Label11" runat="server" Text="Issue" Font-Bold="True" Font-Names="Helvetica" Font-Size="Medium" ForeColor="Black"></asp:Label>
                </td>
                <td style="height: 26px">
        <asp:TextBox ID="TextIssue" runat="server" Font-Names="Helvetica" Font-Size="Medium" ForeColor="Black" style="left: 6px; top: -1px; height: 30px; width: 173px;"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td style="width: 74px">
        <asp:Label ID="Label12" runat="server" Text="Description" Font-Bold="True" Font-Names="Helvetica" Font-Size="Medium" ForeColor="Black"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextDesc" runat="server" Font-Names="&nbsp;&nbsp;&nbsp;helvetica&nbsp;&nbsp;&nbsp;&nbsp; " Font-Size="Medium" ForeColor="Black" style="left: 6px; top: -1px; width: 174px; height: 52px"></asp:TextBox>
                    
                </td>
            </tr>
        </table><br />
        <br /><br />
        <asp:Button ID="BtnRaiseTkt" runat="server" Text="RAISE TICKET" Font-Bold="True" Font-Names="Helvetica" Font-Size="Large" ForeColor="Black" style="left: 82px; top: -44px; height: 31px" OnClick="BtnRaiseTkt_Click1" />
        

        <br />
        <br />

        
        </div>

       <div style="height: 184px; margin-left: 527px; width:307px; background-color: #D3D3D3; position: relative; left: 31px; top: -942px;"  id="DivEscalate" runat="server">
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    
        <asp:Label ID="Label16" runat="server" Text="Address an Existing Issue" ForeColor="White" BackColor="Red" Font-Italic="True" Font-Names="helvetica" Font-Size="X-Large" style="position: relative" Font-Overline="True"></asp:Label>
    
        <br />
&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label21" runat="server" Font-Names="helvetica" Font-Size="Medium" ForeColor="Black" style="z-index: 1; position: absolute; top: 80px; left: 12px" Text="Enter Repair Ticket ID"></asp:Label>
&nbsp;<asp:Button ID="BtnEscalateTkt" runat="server" Text="ESCALATE TICKET" Height="25px" ForeColor="Black" style="left: 29px; top: 60px; width: 158px; position: relative;" Font-Bold="True" Font-Size="Medium" OnClick="BtnEscalateTkt_Click"  />
           <asp:TextBox ID="TxtEscalate" runat="server" style="left: 179px; top: 75px; width: 65px; z-index: 1; position: absolute" ForeColor="Black"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />


           </div>
         <div style="height: 163px; position: relative; top: -801px; left: -45px; margin-left: 40px; width: 196px; background-color: #FFFFFF;">
    
        &nbsp;&nbsp;&nbsp;<asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="helvetica" Font-Size="Large" ForeColor="Red" Text="Report Registered" visible="False" style="z-index: 1; position: absolute; top: 8px; left: 12px; width: 170px"></asp:Label>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;<asp:Label ID="Label23" runat="server" ForeColor="Black" Font-Bold="False" Font-Names="Helvetica" Font-Size="Medium" visible="False" >Your Repair Ticket ID is </asp:Label>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        &nbsp; 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LblRefId" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Helvetica" Font-Size="Medium" visible="False" style="z-index: 1; position: absolute; top: 72px; left: 58px" ></asp:Label>
             <br />
             <asp:Label ID="Label15" runat="server" ForeColor="Black" Font-Bold="False" Font-Names="Helvetica" Font-Size="Medium" visible="False">The Technician will arrive on</asp:Label>
             <br />
&nbsp;<br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LblProvisionDate" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Helvetica" Font-Size="Medium" visible="False" style="z-index: 1; position: absolute; top: 133px; left: 32px" ></asp:Label>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
    
    </div>
    <div style="height: 270px;  position: relative; top: -1091px; left: 520px; margin-left: 40px; width: 309px; right: -520px; background-color: #CCCCCC;">
    
        
           <br />
&nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label18" runat="server" Font-Names="Helvetica" Font-Size="Large" ForeColor="Black" Text="We're Here To Help" Font-Bold="True"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <br />
&nbsp;&nbsp;&nbsp;<asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Names="Helvetica" Font-Size="Large" ForeColor="#CC0000" Text="Get answers from your Automated Agent" Width="209px" ></asp:Label>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <br />
           <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/cust service.jpg" Width="90px" style="z-index: 1; position: absolute; top: 157px; left: 193px; height: 88px;" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <br />
           <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Helvetica" Font-Size="Large" ForeColor="#CC0000" Text="1800-4210-3156" style="z-index: 1; position: absolute; top: 186px; left: 27px"></asp:Label>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
    
           <br />
        
    
    </div>
    
   
   
         </ContentTemplate>
    
       
</asp:Content>