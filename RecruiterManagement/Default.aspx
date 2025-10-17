<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="RecruiterManagement._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="p-5">
        <div class="flex items-center justify-between gap-3">
            <div class="bg-gray-200 rounded-md p-3 flex-1">
                <div>
                    Total users
                </div>
                <div class="text-xl font-bold"><%= stats["total_users"] %></div>
            </div>
            <div class="bg-gray-200 rounded-md p-3 flex-1">
                <div>
                    Total Jobs
                </div>
                <div class="text-xl font-bold"><%= stats["total_jobs"] %></div>
            </div>
            <div class="bg-gray-200 rounded-md p-3 flex-1">
                <div>
                    Total Skills
                </div>
                <div class="text-xl font-bold"><%= stats["total_skills"] %></div>
            </div>
            <div class="bg-gray-200 rounded-md p-3 flex-1">
                <div>
                    Total Candidates
                </div>
                <div class="text-xl font-bold"><%= stats["total_candidates"] %></div>
            </div>
        </div>
    </div>
</asp:Content>
