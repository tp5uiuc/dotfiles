#!/usr/bin/env sh

# setups the auto-update
(
	crontab -l | grep -v "dot_update"
	#=====================================================================#
	#     0-23   0-59               0-30  0-6   1-12                      #
	#     |_    _|                 _|    _|    _|                         #
	#       |  |                  |     |     |            * any          #
	#    At HH:MM on day-of-month MD on WD in M            - range        #
	#       |  |                  |     |     |            , array        #
	#     __|__|            ______|     |   __|            / step         #
	#    |  |            __|         ___|__|                              #
	#   _|  |__         |         __|   |__                               #
	#  |       |        |        |         |                              #
	#  |       |        |        |         |                              #
	#=====================================================================#
	#  Min  |  Hour  |  Mday  |  Month  |  Wday  |  Command               #
	#=====================================================================#
	echo "0 0 * * FRI $HOME/.dotfiles/bin/dot_update > ${TMPDIR:-/tmp}/dot_update.log 2>&1"
) | crontab -
