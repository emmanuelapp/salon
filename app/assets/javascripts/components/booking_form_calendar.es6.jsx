class BookingFormCalendar extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      dates: []
    }
  }

  componentDidMount() {
    $.ajax({
      url: '/api/v1/reservation_dates',
      method: 'GET',
      success: ((data) => this.setState({dates: data['available']})).bind(this)
    });
  }

  render () {
    let optionsForSelect = this.state.dates.map((date) => <option key={date}>{date}</option>);

    return(
      <div>
        <label>Reservation time and date</label>

          <div className='form-group'>
            <div className="input-group">
              <span className="input-group-addon">
                <span className="glyphicon glyphicon-calendar" aria-hidden="true"></span>
              </span>

              <select className='form-control' onChange={this.props.onChange} required={true}>
                <option default value=''>Select time and date</option>
                {optionsForSelect}
              </select>
            </div>
          </div>
      </div>
    );
  }
}
