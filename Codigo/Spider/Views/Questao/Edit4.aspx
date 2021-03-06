﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.QuestaoModel>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2></h2>
    
    <script src="../../Scripts/jquery-2.1.3.min.js" type="text/javascript"></script>
    <script src="../../Content/kartik-v-bootstrap-fileinput/js/fileinput.js" type="text/javascript"></script>
    <script src="../../Content/bootstrap-3.3.4-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        SyntaxHighlighter.defaults['toolbar'] = false;
        SyntaxHighlighter.all();
    </script>
    <script src="../../Scripts/addItemAux.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%:Url.Content ("~/Scripts/shBrushCSharp.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/addItem.js") %>" type="text/javascript"></script>
    
    <% using (Html.BeginForm("Edit4", "Questao", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Questão</legend>
        <%: Html.HiddenFor(model => model.id_Survey)%>
        <%: Html.HiddenFor(model => model.id_Questao)%>
        <%: Html.HiddenFor(model => model.Tipo)%>
        <%: Html.HiddenFor(model => model.EhCodigo)%>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Pergunta) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Pergunta, new { @class = "form-control", style = "width:auto", size = 106 })%>
            <%: Html.ValidationMessageFor(model => model.Pergunta) %>
        </div>
        <div class="editor-label">
            <%: Html.EditorFor(model => model.Randomica) %>
            Itens Randômicos?
            <%: Html.ValidationMessageFor(model => model.Randomica) %>
        </div>
        <div class="editor-label">
            <%: Html.EditorFor(model => model.Obrigatoria) %>
            Resposta obrigatória?
            <%: Html.ValidationMessageFor(model => model.Obrigatoria) %>
        </div>
        <div class="editor-label">
            <%: Html.EditorFor(model => model.Escolha) %>
            Múltipla Escolha?
            <%: Html.ValidationMessageFor(model => model.Escolha) %>
        </div>
        
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Linguagem) %>
        </div>
        <%List<SelectListItem> items = new List<SelectListItem>();
          items.Add(new SelectListItem
          {
              Text = "Java",
              Value = "Java"
          });
          items.Add(new SelectListItem
          {
              Text = "CSharp",
              Value = "CSharp",
              Selected = true
          });
          items.Add(new SelectListItem
          {
              Text = "PHP",
              Value = "PHP"
          }); %>
        <div class="editor-field">
            <%: Html.DropDownListFor((model => model.Linguagem), new SelectList(items, "Value", "Text"))%>
            <%: Html.ValidationMessageFor(model => model.Linguagem) %>
        </div>
        
        <div class="editor-label">
            Código
        </div>
        <% foreach (var codigo in Model.codigos)
           { %>
        <textarea class="form-control" rows="5" style="font-family: Monaco,Consolas,monospace; height: 300px;">
                    <%: Model.codigos[0].Codigo%>
        </textarea>
        <% 
                       }  %>
        <div class="page-header">
		<input id="input-23" type="file" name="files" multiple="true"/>
		</div>
        <%: Html.ValidationMessageFor(model => model.codigos)%>
        <div class="editor-label">
            <a href="javascript: addItemAux();">Adicionar Item </a>
        </div>
        <fieldset>
            <div class="editor-label">
                <h3>
                    Itens adicionados
                </h3>
                <%--<a href="javascript: addItem();" >  </a>--%>
            </div>
                        
            <% int k = 0; %>
            <% foreach (var item in Model.itens)
               { %>
            <div class="display-field">
                Nome do item: <input id="itens_<%= k %>__Item" name="itens[<%= k %>].Item" type="text" value="<%= Html.DisplayFor(model => item.Item)%>" /> 
                <input value='Remover' class='remover' type='button'/>
            </div>
            <% k++;
               } %>
            <div class="item">
            </div>
            <div class="AdditemAux">
            </div>
        </fieldset>
        <br />
        <p>
            <input class="btn btn-primary" type="submit" value=" Salvar " />
            <%: Html.ActionLink("Voltar", "ListaQuestoes", new { id = Model.id_Survey }, new { @class = "btn btn-default", @style = "text-decoration:none; color:#333" })%>
        </p>
    </fieldset>
    <% } %>
    <p>
    </p>
    <script type="text/javascript">
        $("#input-23").fileinput({
            allowedFileExtensions: ["txt", "aspx", "java", "cs", "text", "php"],
            showUpload: false,
            browseLabel: "Selecionar Código",
            layoutTemplates: {
                main1: "{preview}\n" +
                "<div class=\'input-group {class}\'>\n" +
                "   <div class=\'input-group-btn\'>\n" +
                "       {browse}\n" +
                "       {remove}\n" +
                "   </div>\n" +
                "   {caption}\n" +
                "</div>"
            }
        });
    </script>
    <script>
        $('.remover').click(function () {
            $(this).closest('div').hide();
            $(this).closest('div').find("input[type = text]").val("");
        });
    </script>
</asp:Content>