import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import DomusRotas from './paginas/DomusRotas'
import { BrowserRouter } from 'react-router-dom'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <BrowserRouter>
      <DomusRotas/>
    </BrowserRouter>
  </StrictMode>,
)
