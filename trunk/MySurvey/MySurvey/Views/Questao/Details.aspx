﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Modelos.QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>QuestaoModel</legend>

    <div class="display-label">id_Questao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.id_Questao) %>
    </div>

    <div class="display-label">idTB_ITENS_DA_QUESTAO</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.idTB_ITENS_DA_QUESTAO) %>
    </div>

    <div class="display-label">id_Survey</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.id_Survey) %>
    </div>

    <div class="display-label">Tipo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Tipo) %>
    </div>

    <div class="display-label">Pergunta</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Pergunta) %>
    </div>

    <div class="display-label">Randomica</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Randomica) %>
    </div>

    <div class="display-label">Obrigatoria</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Obrigatoria) %>
    </div>

    <div class="display-label">Codigo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Codigo) %>
    </div>

    <div class="display-label">Linguagem</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Linguagem) %>
    </div>
</fieldset>
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
