import React, { useState }  from 'react'
import Choices              from './Choices'
import OneLineConfirmation  from './OneLineConfirmation'


const OneLineItemableForm = props => {
  const questions           = props.questions
  const line_itemable_id    = props.line_itemable_id
  const line_itemable_type  = props.line_itemable_type
  const work_type_id        = props.work_type_id
  const csrf_token          = props.csrf_token

  const [answers, setAnswers]   = useState([]);
  const [position, setPosition] = useState(0);
  const [input, setInput]       = useState('');

  const handleClick = id => {
    setAnswers([...answers, id])
    setPosition(position + 1)
  };

  const handleInput = event => {
    setInput(event.target.value)
  };

  const handleSubmit = event => {
    setAnswers([...answers, input])
    setInput('')
    setPosition(position + 1)
    event.preventDefault()
  };

  if (questions.length > position) {
    return (
      <div>
        <h4>{questions[position].name}</h4>
        <Choices  question={questions[position]}
                  handleClick={handleClick}
                  input={input}
                  handleInput={handleInput}
                  handleSubmit={handleSubmit} />
      </div>
    );
  } else {
    return (
      <OneLineConfirmation work_type_id={work_type_id}
                    line_itemable_id={line_itemable_id}
                    line_itemable_type={line_itemable_type}
                    questions={questions}
                    answers={answers}
                    csrf_token={csrf_token} />
    );
  }
}

export default OneLineItemableForm