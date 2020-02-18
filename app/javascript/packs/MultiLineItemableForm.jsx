import React, { useState }    from 'react'
import Question               from './Question'
import Answer                 from './Answer'
import MultiLineConfirmation  from './MultiLineConfirmation'


const MultiLineItemableForm = props => {
  const questions           = props.questions
  const line_itemable_id    = props.line_itemable_id
  const line_itemable_type  = props.line_itemable_type
  const work_type_id        = props.work_type_id
  const csrf_token          = props.csrf_token

  const [answers, setAnswers]   = useState([]);
  const [answer, setAnswer]     = useState({});
  const [position, setPosition] = useState(0);
  const [step, setStep]         = useState(0);
  const [input, setInput]       = useState('');

  const handleClick = choice => {
    if (choice) {
      setAnswer({...answer, id: questions[position].id});
      setStep(step + 1);
    } else {
      setPosition(position + 1);
    }
  };

  const handleInput = event => {
    setInput(event.target.value)
  };

  const handleSubmit = event => {
    if (step == 1) {
      setAnswer({...answer, quantity: input});
      setStep(step + 1);
    } else {
      setAnswers([...answers, {...answer, price: input}]);
      setStep(0);
      setPosition(position + 1);
    }
    setInput('')
    event.preventDefault()
  };
  if (questions.length > position) {
    return (
      <div>
        <Question question={questions[position]}
                  step={step} />
        <Answer question={questions[position]}
                step={step}
                handleClick={handleClick}
                input={input}
                handleInput={handleInput}
                handleSubmit={handleSubmit} />
      </div>
    );
  } else {
    return (
      <MultiLineConfirmation work_type_id={work_type_id}
                    line_itemable_id={line_itemable_id}
                    line_itemable_type={line_itemable_type}
                    answers={answers}
                    csrf_token={csrf_token} />
    );
  }
}

export default MultiLineItemableForm