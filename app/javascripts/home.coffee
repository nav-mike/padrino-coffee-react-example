###* @jsx React.DOM ###

$(document).ready ->
  PasswordFields = React.createClass
    ERROR_CLASS: 'has-error'

    SUCCESS_CLASS: 'has-success'

    getInitialState: ->
      {classVal: 'form-group'}

    handleChange: ->
      confirm = React.findDOMNode(@refs.confirm).value.trim()
      password = React.findDOMNode(@refs.password).value.trim()

      @setState {classVal: "form-group #{@ERROR_CLASS}"} unless confirm is password
      @setState {classVal: "form-group #{@SUCCESS_CLASS}"} if confirm is password

    render: ->
      return (
        `<div className="passwordFields">
          <form className='form-inline'>
            <div className={this.state.classVal}>
              <input type='password' className='form-control' ref='password' placeholder='Password' />
            </div>
            <div className={this.state.classVal}>
              <input type='password' className='form-control' ref='confirm' placeholder='Confirm password' onChange={this.handleChange} />
            </div>
          </form>
        </div>`
        )

  React.render(
    `<PasswordFields />`,
    document.getElementById('reactApp')
  )
