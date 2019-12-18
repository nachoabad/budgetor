import React from 'react'

function Answers(props) {
  return (
    props.answers.map(answer => (
      <input type='hidden' name="budget[answers][]" value={answer} />
    ))
  );
}

export default Answers