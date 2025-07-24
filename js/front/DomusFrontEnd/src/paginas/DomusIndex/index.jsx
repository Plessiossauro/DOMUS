import './style.css'
import iconeCasa from '../../imagens/icone-casas.jpg'
import React from "react";
import { useNavigate } from "react-router-dom";

function DomusIndex(){

  const navigate = useNavigate()

  const vaiParaHome = () => {
    navigate("/home")
  }

  return (
    <>
      <div>
          <img src={iconeCasa} width="300" height="200" />
          <h1>Sistema Domus</h1>
          <h3>Versão 0.1.0</h3>
          <br />
            <button id="btnEntrar" onClick={vaiParaHome}>Entrar</button>
          <p>
            <em>
              O melhor Sistema para corretores de imóveis de todos os tempos!
              <br />- Por quê? <br />- Porque ele presta contas claramente,
              identificando todas as etapas da venda ou aluguel e o percentual da
              comissão do corretor, e da corretora, se for o caso.
            </em>
          </p>
      </div>
    </>
  )
}

export default DomusIndex