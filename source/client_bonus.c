/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tstrassb <tstrassb@student.42>             +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/13 08:34:23 by tstrassb          #+#    #+#             */
/*   Updated: 2023/02/15 09:47:23 by tstrassb         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/minitalk_bonus.h"

/// @brief function that handles the receipt of a Unix signal.
/// @param signal signal number that the process has received.
static void	signal_confirm(int signal)
{
	if (signal == SIGUSR1)
		ft_printf("received!\n", 1);
	else
		ft_printf("received!\n", 1);
}

/// @brief function that sends signals to a process with a PID
/// @param pid the process ID that receives signals
/// @param i the charater to be transmitted
void	signal_sendbits(int pid, char i)
{
	int	bit;

	bit = 0;
	while (bit < 8)
	{
		if ((i & (0x01 << bit)) != 0)
			kill(pid, SIGUSR1);
		else
			kill(pid, SIGUSR2);
		usleep(100);
		bit++;
	}
}

int	main(int argc, char **argv)
{
	int	pid;
	int	i;

	i = 0;
	if (argc == 3)
	{
		pid = ft_atoi(argv[1]);
		while (argv[2][i] != '\0')
		{
			signal(SIGUSR1, signal_confirm);
			signal(SIGUSR2, signal_confirm);
			signal_sendbits(pid, argv[2][i]);
			i++;
		}
		signal_sendbits(pid, '\n');
	}
	else
	{
		ft_printf("Error: format is wrong\n");
		ft_printf("Correct syntax: ./client <PID> <\"message\">\n");
		return (1);
	}
	return (0);
}
