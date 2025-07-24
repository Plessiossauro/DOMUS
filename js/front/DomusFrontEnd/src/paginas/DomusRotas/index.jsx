import React from "react";
import { Routes, Route } from "react-router-dom";
import DomusIndex from "../DomusIndex";
import DomusHome from "../DomusHome";

function DomusRotas() {
  return (
    <Routes>
      <Route path="/" element={<DomusIndex />} />
      <Route path="/home" element={<DomusHome />} />
    </Routes>
  );
}

export default DomusRotas;