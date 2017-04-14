// import Calendar from 'rc-calendar';

class BookingFormCalendar extends React.Component {
  render () {
    return(
      <div>
        <label>Reservation date</label>
          <div className='form-group'>
            <div className="input-group">
              <span className="input-group-addon">
                <span className="glyphicon glyphicon-calendar" aria-hidden="true"></span>
              </span>

              <select className='form-control'>
                <option>1</option>
                <option>2</option>
                <option>3</option>
              </select>

              <select className='form-control'>
                <option>1</option>
                <option>2</option>
                <option>3</option>
              </select>

              <select className='form-control'>
                <option>1</option>
                <option>2</option>
                <option>3</option>
              </select>

              <select className='form-control'>
                <option>1</option>
                <option>2</option>
                <option>3</option>
              </select>

              <select className='form-control'>
                <option>1</option>
                <option>2</option>
                <option>3</option>
              </select>
            </div>
          </div>
      </div>
    );
  }
}
