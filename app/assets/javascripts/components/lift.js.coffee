@Lift = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.lift.date
      React.DOM.td null, @props.lift.lift_name
      React.DOM.td null, @props.lift.weight_lifted
      React.DOM.td null, @props.lift.is_metric.toString()
      React.DOM.td null, @props.lift.reps_performed
      React.DOM.td null, @props.lift.one_rm
