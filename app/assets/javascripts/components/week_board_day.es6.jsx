class WeekBoardDay extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      showAdditionalInfo: false
    };

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    // this.setState((prevState, props) => {
    //   showAdditionalInfo: !prevState.showAdditionalInfo
    // });

    // alert(this.props.booking.additional_info);
    // alert(this.states.showAdditionalInfo.toString());
  }

  render () {
    let firstName = this.props.booking.first_name;
    let lastName = this.props.booking.last_name;
    let reservedAt = new Date(this.props.booking.reserved_at).toLocaleString();

    return(
      <tr>
        <div className='well well-sm'>
          <a onClick={this.handleClick}>info</a>

          <p>ID: {this.props.booking.id}</p>
          <b>{firstName} {lastName}</b><br />

          <b>{reservedAt}</b>
        </div>
      </tr>
    );
  }
}
