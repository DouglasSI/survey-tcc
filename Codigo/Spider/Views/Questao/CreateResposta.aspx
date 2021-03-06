﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.RespostaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CreateResposta
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>CreateResposta</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>RespostaModel</legend>

       <%: Html.HiddenFor(model => model.id_Questao, new { Value = ViewBag.id_Questao })%>

        <%--<div class="editor-label">
            <%: Html.LabelFor(model => model.idtb_entrevistado) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.idtb_entrevistado) %>
            <%: Html.ValidationMessageFor(model => model.idtb_entrevistado) %>
        </div>--%>

       <%-- <div class="display-label">
            <%: Html.LabelFor(model => model.id_Questao) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.id_Questao, new { Value = ViewBag.id_Questao })%>
        </div>--%>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Resposta) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Resposta) %>
            <%: Html.ValidationMessageFor(model => model.Resposta) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Item) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Item) %>
            <%: Html.ValidationMessageFor(model => model.Item) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Voltar", "Index", new { @class = "button" })%>
</div>

</asp:Content>
