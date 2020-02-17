import React, { useState }    from 'react'
import ReactDOM               from 'react-dom'
import OneLineItemableForm    from './OneLineItemableForm'
import MultiLineItemableForm  from './MultiLineItemableForm'

const LineItemableForm = props => {
  
  if (true) {
    return (
      <MultiLineItemableForm questions={props.questions}
                        line_itemable_id={props.line_itemable_id}
                        line_itemable_type={props.line_itemable_type}
                        work_type_id={props.work_type_id}
                        csrf_token={props.csrf_token} />
    );
  } else {
    return (
      <OneLineItemableForm questions={props.questions}
                        line_itemable_id={props.line_itemable_id}
                        line_itemable_type={props.line_itemable_type}
                        work_type_id={props.work_type_id}
                        csrf_token={props.csrf_token} />
    );
  }
}

document.addEventListener('turbolinks:load', () => {
  const node = document.querySelector('#react-lineitemable-form');
  if (node) {
    const questions           = node.dataset.questions;
    const line_itemable_id    = node.dataset.line_itemable_id;
    const line_itemable_type  = node.dataset.line_itemable_type;
    const work_type_id        = node.dataset.work_type_id;
    const csrf_token          = node.dataset.csrf_token;

    ReactDOM.render(
      <LineItemableForm questions={JSON.parse(questions)}
                        line_itemable_id={line_itemable_id}
                        line_itemable_type={line_itemable_type}
                        work_type_id={work_type_id}
                        csrf_token={csrf_token} />,
      node
    )
  }
})
