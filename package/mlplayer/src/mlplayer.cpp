#include "mlplayer.h"

#include <QDebug>

Player::Player(QObject* object)
{
	Q_UNUSED(object);

	qDebug () << "METROLOGICAL : create player";

	QObject::connect(this, &Player::mediaStatusChanged, this, &Player::media_status_changed);
	QObject::connect(this, &Player::stateChanged, this, &Player::state_changed);
	QObject::connect(this, static_cast<void (Player::*)(QMediaPlayer::Error)>(&Player::error), this, static_cast<void (Player::*)(QMediaPlayer::Error)>(&Player::error_occured));
}


Player::~Player()
{
	qDebug () << "METROLOGICAL : destroy player";

	QObject::disconnect(this, &Player::mediaStatusChanged, this, &Player::media_status_changed);
	QObject::disconnect(this, &Player::stateChanged, this, &Player::state_changed);
	QObject::disconnect(this, static_cast<void (Player::*)(QMediaPlayer::Error)>(&Player::error), this, static_cast<void (Player::*)(QMediaPlayer::Error)>(&Player::error_occured));
}

void Player::media_status_changed(QMediaPlayer::MediaStatus _status_)
{
/*
QMediaPlayer::UnknownMediaStatus	0	The status of the media cannot be determined.
QMediaPlayer::NoMedia	1	The is no current media. The player is in the StoppedState.
QMediaPlayer::LoadingMedia	2	The current media is being loaded. The player may be in any state.
QMediaPlayer::LoadedMedia	3	The current media has been loaded. The player is in the StoppedState.
QMediaPlayer::StalledMedia	4	Playback of the current media has stalled due to insufficient buffering or some other temporary interruption. The player is in the PlayingState or PausedState.
QMediaPlayer::BufferingMedia	5	The player is buffering data but has enough data buffered for playback to continue for the immediate future. The player is in the PlayingState or PausedState.
QMediaPlayer::BufferedMedia	6	The player has fully buffered the current media. The player is in the PlayingState or PausedState.
QMediaPlayer::EndOfMedia	7	Playback has reached the end of the current media. The player is in the StoppedState.
QMediaPlayer::InvalidMedia	8	The current media cannot be played. The player is in the StoppedState.
*/
	qDebug () << "METROLOGICAL : status : " << _status_;
}

void Player::state_changed(QMediaPlayer::State _state_)
{
/*
QMediaPlayer::StoppedState	0	The media player is not playing content, playback will begin from the start of the current track.
QMediaPlayer::PlayingState	1	The media player is currently playing content.
QMediaPlayer::PausedState	2	The media player has paused playback, playback of the current track will resume from the position the player was paused at.
*/

	qDebug () << "METROLOGICAL : state : " << _state_;
}

void Player::error_occured(QMediaPlayer::Error _error_)
{
/*
QMediaPlayer::NoError	0	No error has occurred.
QMediaPlayer::ResourceError	1	A media resource couldn't be resolved.
QMediaPlayer::FormatError	2	The format of a media resource isn't (fully) supported. Playback may still be possible, but without an audio or video component.
QMediaPlayer::NetworkError	3	A network error occurred.
QMediaPlayer::AccessDeniedError	4	There are not the appropriate permissions to play a media resource.
QMediaPlayer::ServiceMissingError	5	A valid playback service was not found, playback cannot proceed.
*/
	qDebug () << "METROLOGICAL : error : " << _error_;
}
