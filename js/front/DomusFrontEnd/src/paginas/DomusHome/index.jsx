import "./style.css";
import { Link } from "react-router-dom";
import iconeCasa from "../../imagens/icone-casas.jpg";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faSignOut } from "@fortawesome/free-solid-svg-icons";

function DomusHome() {
  return (
    <>
      <div id="div_cabecalho" className="div_cabecalho">
        <div id="logo_cabecalho">
          <Link to={"/home"}>
            <img src={iconeCasa} width="100" height="80" />
          </Link>
        </div>
        <div id="div_funcionalidade">
          <h2>Tela Home do Sistema Domus</h2>
          <span className="spanMSG">
            &#9748; MENSAGENS DE SUCESSO OU ERRO DO SISTEMA !!!
          </span>
        </div>
        <div id="div_dados_login">
          Usuário: Pedro Pedro&nbsp;
          <Link to={"/"}>
            <FontAwesomeIcon icon={faSignOut} color="red" />
          </Link>
          <br />
          Perfil: Corretor de Imóveis
          <br />
          <br />
          Últ Login:<data>14/06/2025 16:15</data>
          <br />
        </div>
      </div>
      <div id="div_central" className="div_central">
        <nav id="menu">
          <ul>
            <li>
              Segurança
              <ol>
                <li>
                  Usuário
                  <ol>
                    <li>
                      <a href="./UsuarioListar.html">Listar</a>
                    </li>
                    <li>
                      <a href="./UsuarioCadastrar.html">Cadastrar</a>
                    </li>
                  </ol>
                </li>
                <li>
                  <a href="./SenhaAlterar.html">Alterar Senha</a>
                </li>
              </ol>
            </li>
            <li>
              Transações Imobiliárias
              <ol>
                <li>
                  <a href="./CaptarImovel.html">Captar Imóvel</a>
                </li>
                <li>
                  <a href="./VenderImovel.html">Vender Imóvel</a>
                </li>
                <li>
                  <a href="./AlugarImovel.html">Alugar Imóvel</a>
                </li>
                <li>
                  <a href="./VisitarImovel.html">Registrar Visita ao Imóvel</a>
                </li>
                <li>
                  <a href="./ConsultarComissao.html">Consultar Comissão</a>
                </li>
              </ol>
            </li>
          </ul>
        </nav>
        <div id="div_conteudo">
          <img src={iconeCasa} width="300" height="200" />
        </div>
      </div>
      <div id="div_rodape" className="div_rodape">
        rodapé
      </div>
    </>
  );
}

export default DomusHome;

/*
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Protótipo home</title>

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Capriola&display=swap"
      rel="stylesheet"
    />

    <style>
      .capriola-regular {
        font-family: "Capriola", sans-serif;
        font-weight: 400;
        font-style: normal;
      }
      * {
        font-family: "Capriola", sans-serif;
        font-weight: 400;
        font-style: normal;
      }
    </style>
  </head>
  <body>
    <div id="root" style="display: flex; flex-direction: column">
      <div
        id="div_cabecalho"
        style="
          display: flex;
          justify-content: space-between;
          background-color: aquamarine;
          height: 10%;
        "
      >
        <div id="logo_cabecalho">
          <a href="./home.html">
            <img src="./img/icone-casas.jpg" width="100" height="80" />
          </a>
        </div>
        <div id="div_funcionalidade">
          <h2>Tela Home do Sistema Domus</h2>
          <span style="background-color: cornsilk"
            >&#9748; MENSAGENS DE SUCESSO OU ERRO DO SISTEMA !!!
          </span>
        </div>
        <div id="div_dados_login">
          Usuário: Pedro Pedro&nbsp;
          <i class="fa fa-sign-out" style="color: red"></i><br />
          Perfil: Corretor de Imóveis<br />
          <br />
          Últ Login:<data>14/06/2025 16:15</data><br />
        </div>
      </div>
      <div
        id="div_central"
        style="
          display: flex;
          justify-content: flex-start;
          background-color: cadetblue;
          height: 90%;
        "
      >
        <nav id="menu">
          <ul>
            <li>
              Segurança
              <ol>
                <li>
                  Usuário
                  <ol>
                    <li><a href="./UsuarioListar.html">Listar</a></li>
                    <li><a href="./UsuarioCadastrar.html">Cadastrar</a></li>
                  </ol>
                </li>
                <li><a href="./SenhaAlterar.html">Alterar Senha</a></li>
              </ol>
            </li>
            <li>
              Transações Imobiliárias
              <ol>
                <li><a href="./CaptarImovel.html">Captar Imóvel</a></li>
                <li><a href="./VenderImovel.html">Vender Imóvel</a></li>
                <li><a href="./AlugarImovel.html">Alugar Imóvel</a></li>
                <li>
                  <a href="./VisitarImovel.html">Registrar Visita ao Imóvel</a>
                </li>
                <li>
                  <a href="./ConsultarComissao.html">Consultar Comissão</a>
                </li>
              </ol>
            </li>
          </ul>
        </nav>
        <div id="div_conteudo">
          <img src="./img/icone-casas.jpg" width="400" height="300" />
        </div>
      </div>
      <div
        id="div_rodape"
        style="
          display: flex;
          justify-content: flex-start;
          background-color: burlywood;
          height: 10%;
        "
      >
        rodapé
      </div>
    </div>
  </body>
</html>
*/
