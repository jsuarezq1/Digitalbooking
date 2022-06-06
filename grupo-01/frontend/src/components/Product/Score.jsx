import React from "react";
import { IoStarSharp } from "react-icons/io5";

const Score = () => {
  return (
    <>
      <div className="container-score-jsx">
        <div className="score">
          <p>Muy bueno</p>
          <div>
            <IoStarSharp className="star" />
            <IoStarSharp className="star" />
            <IoStarSharp className="star" />
            <IoStarSharp className="star" />
            <IoStarSharp className="star" />
          </div>
        </div>

        <div className="score-number">
          <p>8</p>
        </div>
      </div>
    </>
  );
};

export default Score;
