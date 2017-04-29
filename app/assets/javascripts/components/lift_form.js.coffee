@LiftForm = React.createClass
  getInitialState: ->
    date: ''
    lift_name: ''
    is_metric: ''
    weight_lifted: ''
    reps_performed: ''
    one_rm: ''

  handleValueChange: (e) ->
    valueName = e.target.name
    @setState "#{ valueName }": e.target.value

  valid: ->
    @state.date && @state.lift_name && @state.is_metric && @state.weight_lifted && @state.reps_performed && @state.one_rm

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { lift: @state }, (data) =>
      @props.handleNewLift data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'date'
          className: 'form-control'
          placeholder: 'date'
          name: 'date'
          value: @state.date
          onChange: @handleValueChange
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'lift_name'
          name: 'lift_name'
          value: @state.lift_name
          onChange: @handleValueChange
        React.DOM.input
          type: 'boolean'
          className: 'form-control'
          placeholder: 'is_metric'
          name: 'is_metric'
          value: @state.is_metric
          onChange: @handleValueChange
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'weight_lifted'
          name: 'weight_lifted'
          value: @state.weight_lifted
          onChange: @handleValueChange
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'reps_performed'
          name: 'reps_performed'
          value: @state.reps_performed
          onChange: @handleValueChange
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'one_rm'
          name: 'one_rm'
          value: @state.one_rm
          onChange: @handleValueChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Create Lift'
