﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Criar Questão
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <script type="text/javascript">
        SyntaxHighlighter.defaults['toolbar'] = false;
        SyntaxHighlighter.all();
    </script>
    <script type="text/javascript" src="<%:Url.Content ("~/Scripts/shBrushCSharp.js")%>"></script>
    <script src="../../Scripts/addItem.js" type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Criar Questão</legend>
        <% Html.HiddenFor(model => model.id_Survey, new { Value = ViewBag.id_Survey });%>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Pergunta) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Pergunta, new { @class = "form-control", style = "width:auto", size = 106 })%>
            <%: Html.ValidationMessageFor(model => model.Pergunta) %>
        </div>
        
            <div class="editor-label">
            <%: Html.EditorFor(model => model.Obrigatoria) %>
                Resposta obrigatória?
            </div>
            <div class="editor-field">
                <%: Html.ValidationMessageFor(model => model.Obrigatoria) %>
            </div>
        
        <br />
        <p>
        <input class="btn btn-primary" type="submit" value="Salvar" /> 
        <%: Html.ActionLink("Voltar", "ModeloQuestoes", "Questao", new { id = ViewBag.id_Survey }, new { @class = "btn btn-default",@id= "text-decoration" })%>
        </p>
    </fieldset>
    <% } %>
    
</asp:Content>
