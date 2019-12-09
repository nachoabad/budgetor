import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import Choices from './Choices'


const BudgetForm = props => {
  const questions = props.questions

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
    setAnswers([...answers, input]);
    setInput('');
    setPosition(position + 1)
    event.preventDefault();
  };

  if (questions.length > position + 1) {
    return (
      <div>
        <h1>{questions[position].name}</h1>
        <Choices question={questions[position]}
                  handleClick={handleClick}
                  input={input}
                  handleInput={handleInput}
                  handleSubmit={handleSubmit} />
      </div>
    );
  } else {
    setPosition(0)
  }
}

document.addEventListener('turbolinks:load', () => {
  const node      = document.querySelector('#budget-form');
  const questions = node.dataset.questions;

  ReactDOM.render(
    <BudgetForm questions={JSON.parse(questions)} />,
    node
  )
})
