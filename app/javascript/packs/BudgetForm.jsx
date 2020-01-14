import React, { useState }  from 'react'
import ReactDOM             from 'react-dom'
import Choices              from './Choices'
import Confirmation         from './Confirmation'


const BudgetForm = props => {
  const questions           = props.questions
  const client_id           = props.client_id
  const line_itemable_id    = props.line_itemable_id
  const line_itemable_type  = props.line_itemable_type
  const work_type_id        = props.work_type_id
  const address             = props.address
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
      <Confirmation work_type_id={work_type_id}
                    client_id={client_id}
                    line_itemable_id={line_itemable_id}
                    line_itemable_type={line_itemable_type}
                    questions={questions}
                    answers={answers}
                    address={address}
                    csrf_token={csrf_token} />
    );
  }
}

document.addEventListener('turbolinks:load', () => {
  const node = document.querySelector('#react-budget-form');
  if (node) {
    const questions           = node.dataset.questions;
    const client_id           = node.dataset.client_id;
    const line_itemable_id    = node.dataset.line_itemable_id;
    const line_itemable_type  = node.dataset.line_itemable_type;
    const work_type_id        = node.dataset.work_type_id;
    const address             = node.dataset.address;
    const csrf_token          = node.dataset.csrf_token;

    ReactDOM.render(
      <BudgetForm questions={JSON.parse(questions)}
                  client_id={client_id}
                  line_itemable_id={line_itemable_id}
                  line_itemable_type={line_itemable_type}
                  work_type_id={work_type_id}
                  address={address}
                  csrf_token={csrf_token} />,
      node
    )
  }
})
