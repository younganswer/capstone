import { ReactNode } from 'react';
import style from '@/style/component/header/index.module.css';

const Header = (props: { title?: string; component?: ReactNode }) => {
	const { title, component } = props;

	return (
		<div className={style.container}>
			<span className={style.title}>{title}</span>
			{component}
		</div>
	);
};

export default Header;
