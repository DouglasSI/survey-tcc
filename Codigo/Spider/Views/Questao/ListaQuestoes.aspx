﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Models.QuestaoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Manter Questões
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


<h3>Manter Questões</h3>


<%--<div class="display-label">Título do Survey</div>
--%>
    <%--
    <% Html.Partial("~/InfoSurvey", ViewBag.id_Survey )%>--%>

<p >
<%--<input type="button" class="btn btn-primary"  onclick="location.href=Questao/ModeloQuestoes/'<%: ViewBag.id_Survey %>'" value="Adicionar Questão"/>--%>
  <%: Html.ActionLink("Adicionar Questão", "ModeloQuestoes", new { id = ViewBag.id_Survey }, new { @class = "btn btn-primary", @style = "text-decoration:none; color:#fff"})%>
</p>

<table>
    <tr>
        <th>
            Pergunta
        </th>
        <th>
            Randomica
        </th>
        <th>
            Obrigatoria
        </th>
        <th id="thc">
            Ações
        </th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <%: Html.HiddenFor(model => item.id_Survey, new { Value = ViewBag.id_Survey })%>
        <td>
            <%: Html.DisplayFor(modelItem => item.Pergunta) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Randomica) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Obrigatoria) %>
        </td>
        <td>
            <%: Html.ActionLink("Editar Questão", "Edit", new { id = item.id_Questao }, new { @class = "button" })%> 
            <%: Html.ActionLink("Excluir Questão", "Delete", new { id = item.id_Questao }, new { @class = "button" })%> 
            <%: Html.ActionLink("Mover para Cima", "Delete", new { id = item.id_Questao }, new { @class = "button" })%>
            <%: Html.ActionLink("Mover para Baixo", "Delete", new { id = item.id_Questao }, new { @class = "button" })%>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
