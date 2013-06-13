#ifndef MLPLAYER_H
#define MLPLAYER_H

#include <QMediaPlayer>
#include <QVideoWidget>

#include <QObject>

class Player : public QMediaPlayer
{
Q_OBJECT

public:
	Player(QObject* pObject);
	~Player();

private slots:
	void media_status_changed(QMediaPlayer::MediaStatus _status_);
	void state_changed(QMediaPlayer::State _state_);
	void error_occured(QMediaPlayer::Error _error_);

private:
	QVideoWidget*	pWidget;
};

#endif
