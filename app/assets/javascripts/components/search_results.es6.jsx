class SearchResults extends React.Component {

  renderMeetings() {
    return this.props.meetings.map((meeting) => {
      return <SearchResultsPost meeting={meeting} key={meeting.id} />
    })
  }

  render () {
    return (
      <span>{this.renderMeetings()}</span>
    );
  }

}
